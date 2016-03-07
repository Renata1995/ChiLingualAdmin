// Place your Spring DSL code here
import wslite.rest.*
beans = {
	clientBasicAuth(wslite.http.auth.HTTPBasicAuthorization) {
		username = "Aladdin"
		password = "open sesame"
	}
	
	httpClient(wslite.http.HTTPClient) {
		connectTimeout = 5000
		readTimeout = 10000
		useCaches = false
		followRedirects = false
		sslTrustAllCerts = true
		// authorization = ref('clientBasicAuth')
		// proxy = myproxy
	}
	restClient(wslite.rest.RESTClient) {
		url = "http://localhost:8090/APITesting/"
		httpClient = ref('httpClient')
		authorization = ref('clientBasicAuth')
	}
}
