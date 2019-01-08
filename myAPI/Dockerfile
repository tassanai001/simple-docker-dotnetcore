FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY myAPI/myAPI.csproj myAPI/
RUN dotnet restore myAPI/myAPI.csproj
COPY . .
WORKDIR /src/myAPI
RUN dotnet build myAPI.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish myAPI.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "myAPI.dll"]
