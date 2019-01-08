@echo off

if not "%~0"=="%~dp0.\%~nx0" (
    start /min cmd /c,"%~dp0.\%~nx0" %*
    exit
)

aws polly synthesize-speech --output-format mp3 --voice-id %1 --text %2 %3
