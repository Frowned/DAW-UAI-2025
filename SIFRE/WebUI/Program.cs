using BLL;
using DAL;
using DAL.Helper;
using Infrastructure.Interfaces.BLL;
using Infrastructure.Interfaces.DAL;
using Infrastructure.Session;
using Microsoft.Data.SqlClient;
using System.Data;
using WebUI.Components;
using WebUI.Services;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();
builder.Services.AddControllers();

builder.Services.AddTransient<IUserDAL, UserDAL>();
builder.Services.AddTransient<IUserBLL, UserBLL>();
builder.Services.AddTransient<ILanguageBLL, LanguageBLL>();
builder.Services.AddTransient<ILanguageDAL, LanguageDAL>();
builder.Services.AddTransient<ILogDAL, LogDAL>();
builder.Services.AddTransient<ILogBLL, LogBLL>();
builder.Services.AddTransient<IRoleBLL, RoleBLL>();
builder.Services.AddTransient<IRoleDAL, RoleDAL>();
builder.Services.AddTransient<IProductBLL, ProductBLL>();
builder.Services.AddTransient<IProductDAL, ProductDAL>();
builder.Services.AddTransient<IPointBLL, PointBLL>();
builder.Services.AddTransient<IPointDAL, PointDAL>();
builder.Services.AddTransient<IBackupBLL, BackupBLL>();
builder.Services.AddTransient<IBackupDAL, BackupDAL>();
builder.Services.AddTransient<ICheckDigitBLL, CheckDigitBLL>();
builder.Services.AddTransient<ICheckDigitDAL, CheckDigitDAL>();
builder.Services.AddTransient<INominationBLL, NominationBLL>();
builder.Services.AddTransient<INominationDAL, NominationDAL>();
builder.Services.AddTransient<IRecognitionCategoryBLL, RecognitionCategoryBLL>();
builder.Services.AddTransient<IRecognitionCategoryDAL, RecognitionCategoryDAL>();
builder.Services.AddTransient<INominationRuleBLL, NominationRuleBLL>();
builder.Services.AddTransient<INominationRuleDAL, NominationRuleDAL>();
builder.Services.AddTransient<IObjectiveBLL, ObjectiveBLL>();
builder.Services.AddTransient<IObjectiveDAL, ObjectiveDAL>();
builder.Services.AddTransient<DatabaseHelper>();
builder.Services.AddScoped<SingletonSession>();

DatabaseHelper.Configure(builder.Configuration.GetConnectionString("DefaultConnection"));

builder.Services.AddScoped<IDbConnection>(_ => new SqlConnection(connectionString));
builder.Services.AddHttpClient();
builder.Services.AddSingleton<SerializationService>();

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();          

app.UseAntiforgery();      

app.MapControllers();      

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
