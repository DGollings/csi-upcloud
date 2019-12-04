package main

import (
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/dgollings/csi-upcloud/driver"
)

func main() {
	var (
		endpoint   = flag.String("endpoint", "unix:///var/lib/kubelet/plugins/"+driver.DefaultDriverName+"/csi.sock", "CSI endpoint")
		nodeid     = flag.String("nodeid", "", "node id")
		username   = flag.String("username", "", "Upcloud username")
		password   = flag.String("password", "", "Upcloud password")
		url        = flag.String("url", "https://api.upcloud.com/", "Upcloud API URL")
		driverName = flag.String("driver-name", driver.DefaultDriverName, "Name for the driver")
		address    = flag.String("address", driver.DefaultAddress, "Address to serve on")
		version    = flag.Bool("version", false, "Print the version and exit.")
	)
	flag.Parse()

	if *version {
		fmt.Printf("%s - %s (%s)\n", driver.GetVersion(), driver.GetCommit(), driver.GetTreeState())
		os.Exit(0)
	}

	if *nodeid == "" {
		log.Fatalln("nodeid missing")
	}

	drv, err := driver.NewDriver(*endpoint, *username, *password, *url, *nodeid, *driverName, *address)
	if err != nil {
		log.Fatalln(err)
	}

	if err := drv.Run(); err != nil {
		log.Fatalln(err)
	}
}
