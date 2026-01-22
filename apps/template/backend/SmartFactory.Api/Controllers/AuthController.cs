using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/auth")]
public class AuthController : ControllerBase
{
    private readonly AuthService _auth;

    public AuthController(AuthService auth)
    {
        _auth = auth;
    }

    [HttpPost("login")]
    public IActionResult Login(LoginRequest req)
    {
        var result = _auth.Login(req.Username, req.Password);
        if (result == null)
            return Unauthorized("Invalid credentials");

        return Ok(result);
    }
}
