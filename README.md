# README
To deploy to heroku you need to:
  1. Install heroku on your devise: sudo snap install --classic heroku (for ubuntu) or brew tap heroku/brew && brew install heroku (for MacOS)
  2. Login using heroku: heroku login
  3. Clone the repository: heroku git:clone -a rsc-easy-check
                           cd rsc-easy-check
  4. Deploy your changes: git add .
                          git commit -m "make it better"
                          git push heroku main

test
