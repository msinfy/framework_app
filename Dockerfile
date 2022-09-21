#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat 

#FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
#ARG source
#WORKDIR /inetpub/wwwroot
#COPY ${source:-obj/Docker/publish} .

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

RUN PWD

RUN DIR

# copy csproj and restore as distinct layers
COPY *.csproj .
#COPY . .
RUN dotnet restore

# copy and build everything else


RUN ECHO ".........DIR...after..copy .4........."
RUN DIR


COPY . .
#COPY *.csproj .
WORKDIR /app

RUN ECHO ".........DIR...after..555........."
RUN DIR
RUN dotnet publish -c Release -o out --no-restore


FROM mcr.microsoft.com/dotnet/framework/runtime:4.8 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnetapp.exe"]