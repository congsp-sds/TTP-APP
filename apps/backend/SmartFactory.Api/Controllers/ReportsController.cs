using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/reports")]
public class ReportsController : ControllerBase
{
    private readonly ReportRepository _repo;

    public ReportsController(ReportRepository repo)
    {
        _repo = repo;
    }

    [HttpGet("inventory")]
    public IActionResult Inventory()
    {
        return Ok(_repo.GetInventory());
    }

    [HttpGet("production")]
    public IActionResult Production()
    {
        return Ok(_repo.GetProductionReport());
    }
}
