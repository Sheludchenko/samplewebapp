FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /workdir

COPY src/samplewebapp.csproj .
RUN dotnet restore samplewebapp.csproj

COPY src/. .
RUN dotnet publish -c release -o /out --self-contained false --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine-amd64
WORKDIR /app
COPY --from=build /out .

ENTRYPOINT ["dotnet", "samplewebapp.dll"]