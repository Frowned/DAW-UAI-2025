using BE.DTO;
using BE.Entities;
using DAL.Helper;
using Infrastructure.Interfaces.DAL;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ProductDAL : IProductDAL
    {
        private readonly DatabaseHelper dbHelper;
        private ICheckDigitDAL checkDigitDAL;

        public ProductDAL(ICheckDigitDAL checkDigitDAL)
        {
            dbHelper = new DatabaseHelper();
            this.checkDigitDAL = checkDigitDAL;
        }

        public int AddProduct(ProductDTO productDTO)
        {
            try
            {
                var categories = GetCategories();
                var category = categories.FirstOrDefault(x => x.Description == productDTO.Category);
                string query = $@"INSERT INTO Products (ProductName, Description, StartDate, Points, CategoryId) 
                                  VALUES (@ProductName, @Description, @StartDate, @Points, @CategoryId); 
                                  SELECT SCOPE_IDENTITY();";
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@StartDate", SqlDbType.DateTime) { Value = DateTime.Now },
                    new SqlParameter("@ProductName", SqlDbType.VarChar) { Value = productDTO.ProductName },
                    new SqlParameter("@Description", SqlDbType.VarChar) { Value = productDTO.Description },
                    new SqlParameter("@Points", SqlDbType.BigInt) { Value = productDTO.Points },
                    new SqlParameter("@CategoryId", SqlDbType.Int) { Value = category!.Id }
                };

                object result = dbHelper.ExecuteScalar(query, CommandType.Text, parameters);
                string idMax = result.ToString()!;
                checkDigitDAL.AddCheckDigit("Products", "Id", idMax);
                checkDigitDAL.RecalculateVerticalDigit("Products");
                checkDigitDAL.RecalculateVerticalDigit("Transactions");

                return int.Parse(idMax);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar el producto", ex);
            }
        }

        public void DeleteProduct(int id)
        {
            try
            {
                string query = $@"UPDATE Products SET EndDate = @EndDate WHERE Id = @Id";
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@EndDate", SqlDbType.DateTime) { Value = DateTime.Now },
                    new SqlParameter("@Id", SqlDbType.Int) { Value = id }
                };

                dbHelper.ExecuteNonQuery(query, CommandType.Text, parameters);

                checkDigitDAL.AddCheckDigit("Products", "Id", id.ToString());
                checkDigitDAL.RecalculateVerticalDigit("Products");
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar el producto", ex);
            }
        }

        public IList<Category> GetCategories()
        {
            try
            {
                List<Category> list = new List<Category>();
                string query = $@"SELECT * FROM Categories";
                SqlParameter[] parameters = [];
                DataSet ds = dbHelper.ExecuteDataSet(query, CommandType.Text, parameters);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        Category category = new Category
                        {
                            Id = int.Parse(dr["Id"].ToString()!),
                            Description = dr["Description"].ToString()!,
                        };
                        list.Add(category);
                    }
                    return list.OrderBy(f => f.Description).ToList();
                }
                else
                {
                    return new List<Category>();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<ProductDTO> GetProducts(bool isBenefit, bool showAll = true)
        {
            try
            {
                List<ProductDTO> list = new List<ProductDTO>();
                string query = $@"SELECT p.Id, p.Description, p.ProductName, p.StartDate, p.EndDate, p.Points, c.Description Category 
                                  FROM Products p 
                                  LEFT JOIN Categories c ON c.Id = p.CategoryId 
                                  WHERE " + (isBenefit ? "c.Id = 4" : "c.Id <> 4") +
                                  (showAll ? string.Empty : " AND p.EndDate IS NULL");
                SqlParameter[] parameters = [];
                DataSet ds = dbHelper.ExecuteDataSet(query, CommandType.Text, parameters);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        ProductDTO product = new ProductDTO
                        {
                            Id = int.Parse(dr["Id"].ToString()!),
                            ProductName = dr["ProductName"].ToString()!,
                            Description = dr["Description"].ToString()!,
                            StartDate = dr["StartDate"] != DBNull.Value ? DateTime.Parse(dr["StartDate"].ToString()!) : (DateTime?)null,
                            EndDate = dr["EndDate"] != DBNull.Value ? DateTime.Parse(dr["EndDate"].ToString()!) : (DateTime?)null,
                            Category = dr["Category"].ToString()!,
                            Points = long.Parse(dr["Points"].ToString()!)
                        };
                        list.Add(product);
                    }
                    return list;
                }
                else
                {
                    return new List<ProductDTO>();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void RecalculateProductVerticalDigits()
        {
            checkDigitDAL.RecalculateVerticalDigit("Products");
        }
    }
}