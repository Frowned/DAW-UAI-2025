using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Interfaces.BLL
{
    public interface ICheckDigitBLL
    {
        string VerifyTable(string tableName);
        void RecalculateTable(string tableName, string keyField);
        string GetIdByTable(string tableName);
        void RecalculateVerticalDigit(string tableName);
        bool VerifyVerticalDigit(string tableName);
        IDictionary<string, string> GetVerticalDigits();
        string GetInconsistentIds(string tableName);
        void DeleteRecord(string tableName, int id);
        void ModifyRecord(string tableName, int id);
        string DetectMissingRecords(string tableName);
    }
}
