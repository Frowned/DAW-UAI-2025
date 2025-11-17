using Microsoft.OpenApi.Models;
using Infrastructure.Interfaces.BLL;
using Infrastructure.Interfaces.DAL;
using BLL;
using DAL;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo 
    { 
        Title = "SIFRE WebServices API", 
        Version = "v1",
        Description = "API de servicios web para el sistema SIFRE"
    });
});

// Dependency Injection
builder.Services.AddScoped<IUserBLL, UserBLL>();
builder.Services.AddScoped<INominationBLL, NominationBLL>();
builder.Services.AddScoped<IUserDAL, UserDAL>();
builder.Services.AddScoped<INominationDAL, NominationDAL>();

// CORS configuration
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "SIFRE WebServices API V1");
        c.RoutePrefix = string.Empty;
    });
}

app.UseHttpsRedirection();
app.UseCors("AllowAll");
app.UseAuthorization();
app.MapControllers();

app.Run();
