using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SmartFactory.Infrastructure.Repositories;

namespace SmartFactory.Api.Controllers;

[Authorize]
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

