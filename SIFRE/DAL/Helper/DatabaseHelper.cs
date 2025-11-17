using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace DAL.Helper
{
    public class DatabaseHelper
    {
        private static string? _globalConnectionString;

        private readonly string connectionString;

        public static void Configure(string connectionStringFromWebUI)
        {
            _globalConnectionString = connectionStringFromWebUI;
        }

        public DatabaseHelper()
        {
            connectionString = _globalConnectionString ?? throw new InvalidOperationException("DatabaseHelper no fue configurado.");
        }

        public SqlConnection GetConnection()
        {
            SqlConnection connection = new SqlConnection(this.GetConnectionString());
            connection.Open();
            return connection;
        }
        private string GetConnectionString()
        {
            // Retorna la cadena de conexión desde App.Config

            return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }

        public int ExecuteScalar(string query, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = commandType;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    connection.Open();
                    object result = command.ExecuteScalar();
                    command.Parameters.Clear();
                    return Convert.ToInt32(result);
                }
            }
        }

        public string ExecuteScalar2(string query, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = commandType;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    connection.Open();
                    object result = command.ExecuteScalar();
                    command.Parameters.Clear();
                    return result.ToString();
                }
            }
        }

        public long ExecuteScalarLong(string query, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = commandType;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    connection.Open();
                    object result = command.ExecuteScalar();
                    command.Parameters.Clear();
                    return Convert.ToInt64(result ?? 0);
                }
            }
        }

        public string? ExecuteScalarString(string query, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = commandType;

                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    connection.Open();
                    object result = command.ExecuteScalar();
                    command.Parameters.Clear();
                    return result?.ToString();
                }
            }
        }

        public int ExecuteNonQuery(string query, CommandType commandType = CommandType.Text, SqlParameter[] parameters = null, SqlTransaction transaction = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection, transaction))
                {
                    command.CommandType = commandType;
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }
                    var result = command.ExecuteNonQuery();
                    command.Parameters.Clear();
                    return result;
                }
            }
        }

        public DataSet ExecuteDataSet(string query, CommandType commandType = CommandType.Text, SqlParameter[] parameters = null, SqlTransaction transaction = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection, transaction))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        command.CommandType = commandType;
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);
                        return dataSet;
                    }
                }
            }
        }
    }

}
