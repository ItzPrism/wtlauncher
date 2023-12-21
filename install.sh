
touch launcher.go
echo "Please enter War Thunder directory"
read WTDIR
echo 'package main

import (
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
	"log"
	"os/exec"
	"os"
)

func main() {
	myApp := app.New()
	myWindow := myApp.NewWindow("WT Launcher")

	launchButton := widget.NewButton("Launch War Thunder", func() {
		
		os.Chdir("'$WTDIR'/linux64/")
		cmd := exec.Command("./aces")  
		err := cmd.Run()
		log.Fatal("Launched!")
		if err != nil {
			// Handle error
			log.Fatal(err)
		}
	})

	myWindow.SetContent(container.NewVBox(
		launchButton,
	))

	myWindow.ShowAndRun()
}' >> launcher.go

sudo apt install golang
go mod init github.com/itzprism
go mod tidy
time go install
go build launcher.go


echo "Install Complete!"
