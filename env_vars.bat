for /f %%i in ('cd') do set CURRENT_PATH=%%i

set nnUNet_raw=%CURRENT_PATH%\data\nnUNet_raw
set nnUNet_preprocessed=%CURRENT_PATH%\data\nUNet_preprocessed
set nnUNet_results=%CURRENT_PATH%\data\nnUNet_results
