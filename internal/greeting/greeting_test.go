package greeting

import "testing"

func TestHello(t *testing.T) {
	if got, want := Hello("world"), "Hello, world!"; got != want {
		t.Errorf("Hello() = %q, want %q", got, want)
	}
}
