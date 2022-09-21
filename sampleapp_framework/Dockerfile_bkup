#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat 

#FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
#ARG source
#WORKDIR /inetpub/wwwroot
#COPY ${source:-obj/Docker/publish} .

##------------------------------------------------------------------------------
#FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
#WORKDIR /app

# copy csproj and restore as distinct layers
#COPY *.csproj .
#RUN dotnet restore

# copy and build everything else
#RUN ECHO ".........DIR...after..copy .4........."
#RUN DIR
#COPY . .
#COPY *.csproj .
#WORKDIR /app
#RUN ECHO ".........DIR...after..555........."
#RUN DIR
#RUN dotnet publish -c Release -o out --no-restore


#FROM mcr.microsoft.com/dotnet/framework/runtime:4.8 AS runtime
#WORKDIR /app
#COPY --from=build /app/out ./
#ENTRYPOINT ["dotnetapp.exe"]
#------------------------------------------------------------------------------------------------------

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY sampleapp_framework/*.csproj ./sampleapp_framework/
COPY sampleapp_framework/*.config ./sampleapp_framework/
RUN nuget restore

# copy everything else and build app
COPY sampleapp_framework/. ./sampleapp_framework/
WORKDIR /app/sampleapp_framework
RUN msbuild /p:Configuration=Release -r:False


FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/sampleapp_framework/. ./




