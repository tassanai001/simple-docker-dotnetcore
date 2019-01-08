FROM microsoft/dotnet:sdk AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./myAPI/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
# FROM microsoft/dotnet:aspnetcore-runtime
# WORKDIR /app
WORKDIR /app/myAPI/bin/Debug/netcoreapp2.2
# COPY --from=build-env /app .
ENTRYPOINT ["dotnet", "myAPI.dll"]