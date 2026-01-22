namespace SmartFactory.Application.Reports.Dtos;

public class InventoryDto
{
    public int ProductID { get; set; }
    public string MaCai { get; set; } = string.Empty;
    public string TenSP { get; set; } = string.Empty;
    public int TonKho { get; set; }
}
