# Trial_project
Steps for Running Demo
1. Install python 2.7
2. Open CMD, install robot FW: "pip install robotframework"
3. Open CMD, install SeleniumLibrary (customize selenium library by robot FW comunity): "pip install --upgrade robotframework-seleniumlibrary"
4. Open CMD, install original Selenium Library on python: "pip install selenium"
4. Download chromedriver and push it in the directory "C:\python27\Scripts"
5. Add 3 new environment path: PATH = "C:\Python27;C:\Python27\Scripts;ProjectDirectory\trial_project"
6. In Place where you add environment path, Add PYTHONPATH="D:\trial_project;D:\trial_project\Resources"
7. Open CMD, and go to "ProjectDirectory\trial_project" and run "robot Tests\HeaderTestSuite.robot"
