package msrandom

import (
	"flag"

	"com.gft.tsbo-training.src.go/common/ms-framework/microservice"
)

// ---------------------------------------------------------------------------
// Configuration ...
type Configuration struct {
	microservice.Configuration
}

// IConfiguration ...
type IConfiguration interface {
	microservice.IConfiguration
}

// InitConfigurationFromArgs ...
func InitConfigurationFromArgs(cfg *Configuration, args []string, flagset *flag.FlagSet) {

	if flagset == nil {
		flagset = flag.NewFlagSet("ms-random", flag.PanicOnError)
	}

	microservice.InitConfigurationFromArgs(&cfg.Configuration, args, flagset)
}
