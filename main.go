package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/acarl005/stripansi"
)

var print = flag.String("print", "", "what type of thing to print (groups, commands)")

func main() {
	flag.Parse()

	b := bufio.NewScanner(os.Stdin)
	var groups, commands []string
	var ingroups, incommands bool
	for b.Scan() {
		txt := stripansi.Strip(b.Text())
		if strings.HasPrefix(txt, "      ") {
			continue
		}
		txt = strings.TrimSpace(txt)
		if strings.Contains(txt, "GROUPS") {
			ingroups = true
			incommands = false
			continue
		}
		if strings.Contains(txt, "COMMANDS") {
			ingroups = false
			incommands = true
			continue
		}
		if strings.Contains(txt, "NOTES") {
			break
		}
		if strings.Contains(txt, " ") {
			continue
		}
		if txt == "" {
			continue
		}
		if ingroups {
			groups = append(groups, strings.TrimSpace(txt))
		}
		if incommands {
			commands = append(commands, strings.TrimSpace(txt))
		}
	}
	if err := b.Err(); err != nil {
		log.Fatal(err)
	}

	switch *print {
	case "groups":
		fmt.Println(strings.Join(groups, " "))
	case "commands":
		fmt.Println(strings.Join(commands, " "))
	}
}
