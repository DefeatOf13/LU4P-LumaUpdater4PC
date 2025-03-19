@echo off
setlocal enabledelayedexpansion

    :: Luma
    color B
    type luma.txt
    sleep 4
    cls
    :: Main section
    :Main
        cls
        color 3
        echo Served to you by DefeatOf13 :D
        echo.

        echo Luma3DS Updater (and Downloader) for PC - Download the most used 3DS CFW directly to your Windows PC!
        echo.
        echo.

        echo 1 - Download the latest release
        echo 2 - Download the latest source code
        echo 3 - How do i install this?
        echo 4 - Open the Luma3DS Github page into your browser
        echo 5 - Credits
        echo 6 - Quit
        echo.

        :: User choice
        :input1
            set /p number1=Pick an option: 

            if "%number1%" LSS "1" goto invalid1
            if "%number1%" GTR "6" goto invalid1
            goto valid1

        :: invalid1 - If number1 is greater than 6 or lower than 1
        :invalid1
            echo Enter a number between 1 and 6.
            goto input1

        :: valid1 - Choices
        :valid1
            if %number1%==1 goto DownloadRelease
            if %number1%==2 goto DownloadSC
            if %number1%==3 goto InstallGuide
            if %number1%==4 goto LumaGithubPage
            if %number1%==5 goto Credits
            if %number1%==6 goto ExitScript

    :: Option 1 - DowloadRelease
    :DownloadRelease
        cls
        color 7
        echo Downloading... Please wait
        for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://api.github.com/repos/LumaTeam/Luma3DS/releases/latest' -UseBasicParsing).Content | ConvertFrom-Json | Select-Object -ExpandProperty assets | Select-Object -ExpandProperty browser_download_url | Select-String -Pattern 'zip$'"') do set "downloadLink=%%i"
        curl -L -o Luma3DS-latest.zip %downloadLink%
        goto DownloadCompleted

        :DownloadCompleted
        cls
        echo Download completed, Check the current directory.
        pause
        goto Main

    :: Option 2 - DownloadSC
    :DownloadSC
        cls
        color 7
        echo Downloading... Please wait
        for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://api.github.com/repos/LumaTeam/Luma3DS/releases/latest' -UseBasicParsing).Content | ConvertFrom-Json | Select-Object -ExpandProperty zipball_url"') do set "downloadLink=%%i"
        curl -L -o Luma3DS-source.zip %downloadLink%
        goto DownloadCompleted

    :: Option 3 - InstallGuide
    :InstallGuide
        cls
        color A
        echo 1 - Need to INSTALL Luma3DS (like, for the first time)?
        echo.
        echo 2 - Need to UPDATE Luma3DS to the latest version available?
        echo.
        echo 3 - Go back
        echo.

        :input2
            set /p number2=Pick an option: 
            if "%number2%" LSS "1" goto invalid2
            if "%number2%" GTR "3" goto invalid2
            goto valid2

        :: If number2 is greater than 3 or lower than 1
        :invalid2
            echo Enter a number between 1 and 3.
            goto input2

        :: Choices
        :valid2
            if %number2%==1 goto InstallLuma
            if %number2%==2 goto UpdateLuma
            if %number2%==3 goto Main

        :: Option 1 - InstallLuma
        :InstallLuma
            start https://3ds.hacks.guide/get-started.html
            cls
            goto InstallGuide

        :: Option 2 - UpdateLuma
        :UpdateLuma
            start https://3ds.hacks.guide/restoring-updating-cfw.html
            cls
            goto InstallGuide

    :: Option 4 - LumaGithubPage
    :LumaGithubPage
        start https://github.com/LumaTeam/Luma3DS
        goto Main
    :: Option 5 - Credits
    :Credits
        cls
        color 5
        echo Script made by DefeatOf13 :D
        echo Check my website if you want: https://defitmods.netlify.app/
        echo (CTRL + CLIC to open the link)
        echo.
        echo A big THANK YOU to LumaTeam for creating and updating Luma3DS CFW to this day
        echo.
        echo A small thank you to Peppe30_BRICK, this project was inspired by
        echo his ISFShax Install Script: https://github.com/Peppe30brick
        echo (CTRL + CLIC to open the link)
        echo.
        pause
        goto Main

    :: Option 6 - ExitScript
    :ExitScript