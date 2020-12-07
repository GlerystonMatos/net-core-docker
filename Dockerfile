# Defini a imagem utilizada
FROM mcr.microsoft.com/dotnet/sdk:3.1 as build
WORKDIR /app

# Copia o projeto e restaura as dependencias
COPY *.sln .
COPY NetCoreDocker/*.csproj ./NetCoreDocker/
RUN dotnet restore

# Copia o restante do projeto e realiza o build / publish
COPY NetCoreDocker/. ./NetCoreDocker/
WORKDIR /app/NetCoreDocker
RUN dotnet publish -c Release -o out

# Defini a imagem utilizada
FROM mcr.microsoft.com/dotnet/runtime:3.1 as runtime
WORKDIR /app

# Copia arquivos necessarios
COPY --from=build /app/NetCoreDocker/out ./

# Comando usado para iniciar aplicação
ENTRYPOINT [ "dotnet", "NetCoreDocker.dll" ]