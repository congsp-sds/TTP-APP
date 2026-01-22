using Dapper;
using Microsoft.Data.SqlClient;
using SmartFactory.Application.Reports.Dtos;

namespace SmartFactory.Infrastructure.Repositories;

public class ReportRepository
{
    private readonly string _connectionString;

    public ReportRepository(string connectionString)
    {
        _connectionString = connectionString;
    }

    public IEnumerable<InventoryDto> GetInventory()
    {
        using var conn = new SqlConnection(_connectionString);
        return conn.Query<InventoryDto>("SELECT * FROM V_Inventory");
    }

    public IEnumerable<ProductionReportDto> GetProductionReport()
    {
        using var conn = new SqlConnection(_connectionString);
        return conn.Query<ProductionReportDto>("SELECT * FROM V_ProductionReport");
    }
}
