Guide for Run
1. Install python 2.7
2. Install robot FW: pip install 
3. Install SeleniumLibrary (customize selenium library by robot FW comunity) by command "pip install --upgrade robotframework-seleniumlibrary"
4. Download chromedriver and push it in the directory C:\python27\Scripts
5. Add 3 new environment path: PATH = "C:\Python27;C:\Python27\Scripts;ProjectDirectory\trial_project"
6. In Place where you add environment path, Add PYTHONPATH="D:\trial_project;D:\trial_project\Resources"
7. Open CMD, and go to "ProjectDirectory\trial_project" and run "robot Tests\HeaderTestSuite.robot"