using Infrastructure.Interfaces.BLL;
using Infrastructure.Interfaces.DAL;
using System.Collections.Generic;

namespace BLL
{
    public class CheckDigitBLL : ICheckDigitBLL
    {
        private readonly ICheckDigitDAL _checkDigitDAL;

        public CheckDigitBLL(ICheckDigitDAL checkDigitDAL)
        {
            _checkDigitDAL = checkDigitDAL;
        }

        public void DeleteRecord(string tableName, int id)
        {
            _checkDigitDAL.DeleteRecord(tableName, id);
        }

        public string GetIdByTable(string tableName)
        {
            switch (tableName)
            {
                case "Products":
                case "Transactions":
                case "PointTransfers":
                    return "Id";
                default:
                    return "";
            }
        }

        public string GetInconsistentIds(string tableName)
        {
            return _checkDigitDAL.GetInconsistentIds(tableName);
        }

        public IDictionary<string, string> GetVerticalDigits()
        {
            return _checkDigitDAL.GetVerticalDigits();
        }

        public void ModifyRecord(string tableName, int id)
        {
            _checkDigitDAL.ModifyRecord(tableName, id);

        }

        public void RecalculateTable(string tableName, string keyField)
        {
            _checkDigitDAL.RecalculateTable(tableName, keyField);
        }

        public void RecalculateVerticalDigit(string tableName)
        {
            _checkDigitDAL.RecalculateVerticalDigit(tableName);
        }

        public string VerifyTable(string tableName)
        {
            try
            {
                _checkDigitDAL.VerifyTable(tableName);
                return string.Empty;
            }
            catch (System.Exception e)
            {
                return e.Message + "|" + tableName;
            }
        }

        public bool VerifyVerticalDigit(string tableName)
        {
            return _checkDigitDAL.VerifyVerticalDigit(tableName);
        }

        public string DetectMissingRecords(string tableName)
        {
            return _checkDigitDAL.DetectMissingRecords(tableName);
        }
    }
}
