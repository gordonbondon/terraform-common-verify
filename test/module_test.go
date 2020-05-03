package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	testCases := []struct {
		name          string
		expectedError string
	}{
		{name: "valid", expectedError: ""},
		{name: "invalid", expectedError: "Value must be in a, b, c"},
		{name: "misconfigured", expectedError: "Match should evaluate to true or false, got wrong"},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			terraformOptions := &terraform.Options{
				TerraformDir: fmt.Sprintf("./fixtures/%s", tc.name),
				NoColor:      true,
			}

			output, err := terraform.InitAndPlanE(t, terraformOptions)

			if err != nil {
				if tc.expectedError == "" {
					t.Errorf("Expected no error but got:\n%v", output)
				}

				if !strings.Contains(output, tc.expectedError) {
					t.Errorf("Expected error: `%s` but got:\n%v", tc.expectedError, output)
				}
			}
		})
	}
}
