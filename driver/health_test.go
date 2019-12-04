package driver

import (
	"context"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

	upcloudclient "github.com/UpCloudLtd/upcloud-go-api/upcloud/client"
	upcloudservice "github.com/UpCloudLtd/upcloud-go-api/upcloud/service"
)

func TestUpcloudHealthChecker_Name(t *testing.T) {
	c := upcloudHealthChecker{}
	if want, got := "upcloud", c.Name(); want != got {
		t.Errorf("incorrect name\nwant: %#v \n got: %#v", want, got)
	}
}

func TestUpcloudHealthChecker_Check(t *testing.T) {
	c := upcloudHealthChecker{}

	t.Run("healthy upcloud", func(t *testing.T) {
		ts := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
			w.WriteHeader(http.StatusOK)
			w.Write([]byte(`{"account":null}`))
		}))
		defer ts.Close()

		username := os.Getenv("UPCLOUD_USERNAME")
		password := os.Getenv("UPCLOUD_PASSWORD")
		client := upcloudclient.New(username, password)
		svc := upcloudservice.New(client)
		var err error
		c.account = svc.GetAccount

		err = c.Check(context.Background())
		if err != nil {
			t.Errorf("expected no error: %s", err)
		}
	})

	t.Run("unhealthy upcloud", func(t *testing.T) {
		ts := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
			w.WriteHeader(http.StatusInternalServerError)
		}))
		defer ts.Close()

		username := "badusername"
		password := "badpassword"
		client := upcloudclient.New(username, password)
		svc := upcloudservice.New(client)
		var err error
		c.account = svc.GetAccount

		err = c.Check(context.Background())
		if err == nil {
			t.Error("expected error but got none")
		}
	})
}
