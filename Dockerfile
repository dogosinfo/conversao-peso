FROM mcr.microsoft.com/dotnet/sdk:5.0 as build
WORKDIR app
COPY . .
RUN dotnet publish -c Release -o published

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR app
COPY --from=build /app/published .
EXPOSE 5000
ENTRYPOINT dotnet ConversaoPeso.Web.dll