using DAL.Helper;
using Infrastructure.Interfaces.DAL;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace DAL
{
    public class CheckDigitDAL : ICheckDigitDAL
    {
        private DatabaseHelper helper;

        public CheckDigitDAL()
        {
            helper = new DatabaseHelper();
        }

        public void VerifyTable(string tableName)
        {
            string inconsistentes = GetInconsistentIds(tableName);
            if (!string.IsNullOrEmpty(inconsistentes))
                throw new Exception($"Inconsistencia detectada en tabla: {tableName}. IDs: {inconsistentes}");
        }
        public void RecalculateTable(string tableName, string keyField)
        {
            string query = $"SELECT * FROM {tableName};";
            DataSet dataSet = helper.ExecuteDataSet(query);

            if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in dataSet.Tables[0].Rows)
                {
                    int dvhIndex = row.Table.Columns["CheckDigitHorizontal"].Ordinal;
                    string concatenatedValues = "";
                    for (int i = 0; i < row.ItemArray.Length; i++)
                    {
                        if (i == dvhIndex) continue;
                        concatenatedValues += row[i]?.ToString() ?? "";
                    }
                    string encryptedString = GetSHA256(concatenatedValues);
                    string updateQuery = $"UPDATE {tableName} SET CheckDigitHorizontal = @hash WHERE {keyField} = @id;";
                    helper.ExecuteNonQuery(updateQuery, CommandType.Text, new SqlParameter[] {
                        new SqlParameter("@hash", encryptedString),
                        new SqlParameter("@id", row[keyField])
                    });
                }
            }
        }

        public void AddCheckDigit(string tableName, string keyField, string keyValue)
        {
            string query = $"SELECT * FROM {tableName} WHERE {keyField} = @id;";
            DataSet dataSet = helper.ExecuteDataSet(query, CommandType.Text, new SqlParameter[] {
                new SqlParameter("@id", keyValue)
            });

            if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
            {
                DataRow row = dataSet.Tables[0].Rows[0];
                int dvhIndex = row.Table.Columns["CheckDigitHorizontal"].Ordinal;
                string concatenatedValues = "";
                for (int i = 0; i < row.ItemArray.Length; i++)
                {
                    if (i == dvhIndex) continue;
                    concatenatedValues += row[i]?.ToString() ?? "";
                }
                string encryptedString = GetSHA256(concatenatedValues);
                string updateQuery = $"UPDATE {tableName} SET CheckDigitHorizontal = @hash WHERE {keyField} = @id;";
                helper.ExecuteNonQuery(updateQuery, CommandType.Text, new SqlParameter[] {
                    new SqlParameter("@hash", encryptedString),
                    new SqlParameter("@id", keyValue)
                });
            }
        }
        public void RecalculateVerticalDigit(string tableName)
        {
            string query = $"SELECT CheckDigitHorizontal FROM {tableName}";
            DataSet ds = helper.ExecuteDataSet(query, CommandType.Text);

            var sb = new StringBuilder();
            foreach (DataRow row in ds.Tables[0].Rows)
                if (row["CheckDigitHorizontal"] != DBNull.Value)
                    sb.Append(row["CheckDigitHorizontal"].ToString());

            string dvv = GetSHA256(sb.ToString());

            // Primero eliminar el registro existente si existe
            string delete = "DELETE FROM IntegrityControl WHERE TableName = @table";
            helper.ExecuteNonQuery(delete, CommandType.Text, new SqlParameter[] {
                new SqlParameter("@table", SqlDbType.VarChar, 100) { Value = tableName }
            });

            // Luego insertar el nuevo registro
            string insert = "INSERT INTO IntegrityControl (TableName, CheckDigitVertical, FechaCalculo) VALUES (@table, @dvv, GETDATE())";
            int affected = helper.ExecuteNonQuery(insert, CommandType.Text, new SqlParameter[] {
                new SqlParameter("@table", SqlDbType.VarChar, 100) { Value = tableName },
                new SqlParameter("@dvv", SqlDbType.VarChar, 64) { Value = dvv }
            });

            if (affected <= 0)
                throw new Exception("No se pudo insertar el registro de DVV en IntegrityControl.");
        }

        public bool VerifyVerticalDigit(string tableName)
        {
            string query = $"SELECT CheckDigitHorizontal FROM {tableName}";
            DataSet ds = helper.ExecuteDataSet(query, CommandType.Text);

            var sb = new StringBuilder();
            foreach (DataRow row in ds.Tables[0].Rows)
                if (row["CheckDigitHorizontal"] != DBNull.Value)
                    sb.Append(row["CheckDigitHorizontal"].ToString());

            string dvvCalculated = GetSHA256(sb.ToString());

            string select = "SELECT CheckDigitVertical FROM IntegrityControl WHERE TableName = @table";
            object dvvStored = helper.ExecuteScalar2(select, CommandType.Text, new SqlParameter[] {
                new SqlParameter("@table", SqlDbType.VarChar, 100) { Value = tableName }
            });

            if (dvvStored == null || dvvStored == DBNull.Value)
                throw new Exception("No hay DVV vertical almacenado para la tabla " + tableName);

            if (dvvCalculated != dvvStored.ToString())
                throw new Exception("¡DVV vertical no coincide! Integridad comprometida en " + tableName);

            return true;
        }

        public IDictionary<string, string> GetVerticalDigits()
        {
            string query = "SELECT TableName, CheckDigitVertical FROM IntegrityControl";
            DataSet ds = helper.ExecuteDataSet(query, CommandType.Text);

            var dict = new Dictionary<string, string>();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                    dict[row["TableName"].ToString()] = row["CheckDigitVertical"].ToString();
            }
            return dict;
        }

        public static string GetSHA256(string str)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = sha256.ComputeHash(encoding.GetBytes(str));
                var sb = new StringBuilder();
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
            }
        }

        public string GetInconsistentIds(string tableName)
        {
            string query = $"SELECT * FROM {tableName};";
            DataSet dataSet = helper.ExecuteDataSet(query);

            List<int> inconsistentes = new List<int>();

            if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in dataSet.Tables[0].Rows)
                {
                    int dvhIndex = row.Table.Columns["CheckDigitHorizontal"].Ordinal;
                    string concatenatedValues = "";
                    for (int i = 0; i < row.ItemArray.Length; i++)
                    {
                        if (i == dvhIndex) continue;
                        concatenatedValues += row[i]?.ToString() ?? "";
                    }
                    string encryptedString = GetSHA256(concatenatedValues);
                    if (row["CheckDigitHorizontal"].ToString() != encryptedString)
                        inconsistentes.Add(Convert.ToInt32(row["Id"])); 
                }
            }

            if (inconsistentes.Any())
                return $"Inconsistencias|{string.Join(",", inconsistentes)}|{tableName}";
            else
                return string.Empty;
        }

        public void DeleteRecord(string tableName, int id)
        {
            string sql = $"DELETE FROM {tableName} WHERE Id = @Id";

            helper.ExecuteNonQuery(
                sql,
                CommandType.Text,
                new SqlParameter[]
                {
            new SqlParameter("@Id", id)
                }
            );
        }

        public void ModifyRecord(string tableName, int id)
        {
            string sql = $"UPDATE {tableName} SET ModifiedAt = GETDATE() WHERE Id = @Id";

            helper.ExecuteNonQuery(
                sql,
                CommandType.Text,
                new SqlParameter[]
                {
            new SqlParameter("@Id", id)
                }
            );
        }

        public string DetectMissingRecords(string tableName)
        {
            // Obtener el DVV almacenado
            string select = "SELECT CheckDigitVertical FROM IntegrityControl WHERE TableName = @table";
            object dvvStored = helper.ExecuteScalar2(select, CommandType.Text, new SqlParameter[] {
                new SqlParameter("@table", SqlDbType.VarChar, 100) { Value = tableName }
            });

            if (dvvStored == null || dvvStored == DBNull.Value)
                return string.Empty; // No hay DVV almacenado, no se puede detectar eliminación

            // Calcular el DVV actual
            string query = $"SELECT CheckDigitHorizontal FROM {tableName}";
            DataSet ds = helper.ExecuteDataSet(query, CommandType.Text);

            var sb = new StringBuilder();
            foreach (DataRow row in ds.Tables[0].Rows)
                if (row["CheckDigitHorizontal"] != DBNull.Value)
                    sb.Append(row["CheckDigitHorizontal"].ToString());

            string dvvCalculated = GetSHA256(sb.ToString());

            // Si no coinciden, significa que se eliminaron registros manualmente
            if (dvvCalculated != dvvStored.ToString())
            {
                return $"MissingRecords|Se ha eliminado uno o más registros de la tabla {tableName}|{tableName}";
            }

            return string.Empty;
        }
    }
}
