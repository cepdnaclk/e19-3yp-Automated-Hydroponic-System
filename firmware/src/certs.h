/* Include header file to manipulate data in the flash memory*/
#include <pgmspace.h>

/* Define the thing name which is created in AWS*/
#define THINGNAME "esp32"

/* Declare wifi credentials*/
const char WIFI_SSID[] = "Eng-Student";
const char WIFI_PASSWORD[] = "3nG5tuDt";

/* Declare aws iot endpoint*/
const char AWS_IOT_ENDPOINT[] = "a398am5o3vbqfl-ats.iot.ap-south-1.amazonaws.com";

/* Declare the certificate file (Amazon Root CA1)*/
static const char AWS_CERT_CA[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----
MIIDQTCCAimgAwIBAgITBmyfz5m/jAo54vB4ikPmljZbyjANBgkqhkiG9w0BAQsF
ADA5MQswCQYDVQQGEwJVUzEPMA0GA1UEChMGQW1hem9uMRkwFwYDVQQDExBBbWF6
b24gUm9vdCBDQSAxMB4XDTE1MDUyNjAwMDAwMFoXDTM4MDExNzAwMDAwMFowOTEL
MAkGA1UEBhMCVVMxDzANBgNVBAoTBkFtYXpvbjEZMBcGA1UEAxMQQW1hem9uIFJv
b3QgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALJ4gHHKeNXj
ca9HgFB0fW7Y14h29Jlo91ghYPl0hAEvrAIthtOgQ3pOsqTQNroBvo3bSMgHFzZM
9O6II8c+6zf1tRn4SWiw3te5djgdYZ6k/oI2peVKVuRF4fn9tBb6dNqcmzU5L/qw
IFAGbHrQgLKm+a/sRxmPUDgH3KKHOVj4utWp+UhnMJbulHheb4mjUcAwhmahRWa6
VOujw5H5SNz/0egwLX0tdHA114gk957EWW67c4cX8jJGKLhD+rcdqsq08p8kDi1L
93FcXmn/6pUCyziKrlA4b9v7LWIbxcceVOF34GfID5yHI9Y/QCB/IIDEgEw+OyQm
jgSubJrIqg0CAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
AYYwHQYDVR0OBBYEFIQYzIU07LwMlJQuCFmcx7IQTgoIMA0GCSqGSIb3DQEBCwUA
A4IBAQCY8jdaQZChGsV2USggNiMOruYou6r4lK5IpDB/G/wkjUu0yKGX9rbxenDI
U5PMCCjjmCXPI6T53iHTfIUJrU6adTrCC2qJeHZERxhlbI1Bjjt/msv0tadQ1wUs
N+gDS63pYaACbvXy8MWy7Vu33PqUXHeeE6V/Uq2V8viTO96LXFvKWlJbYK8U90vv
o/ufQJVtMVT8QtPHRh8jrdkPSHCa2XV4cdFyQzR1bldZwgJcJmApzyMZFo6IQ6XU
5MsI+yMRQ+hDKXJioaldXgjUkK642M4UwtBV8ob2xJNDd2ZhwLnoQdeXeGADbkpy
rqXRfboQnoZsG4q5WTP468SQvvG5
-----END CERTIFICATE-----
)EOF";

/* Declare device certificate*/
static const char AWS_CERT_CRT[] PROGMEM = R"KEY(
-----BEGIN CERTIFICATE-----
MIIDWjCCAkKgAwIBAgIVAJm8JzUeCrDMRiOEapATIewuzfYxMA0GCSqGSIb3DQEB
CwUAME0xSzBJBgNVBAsMQkFtYXpvbiBXZWIgU2VydmljZXMgTz1BbWF6b24uY29t
IEluYy4gTD1TZWF0dGxlIFNUPVdhc2hpbmd0b24gQz1VUzAeFw0yMzEyMDkwMzU1
MDVaFw00OTEyMzEyMzU5NTlaMB4xHDAaBgNVBAMME0FXUyBJb1QgQ2VydGlmaWNh
dGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDQUszmPmU7J9+RjwF2
cViD3C6izxc4jevWpw0PYak2AR8mmAAfaX4k1BRR/1o9KHD/xxXVcJTL0Dn6AJum
xruTOeyjfPemgsR8ck3yDBEoBiz8TGJ3vQcwC8ooWJJclNRH7VAcQOJqBkb/+Kn4
LYm56x7nHiWwuQ6qqHL6vUQ3eeuecGHk+iQ3ZitUWXkLXnjXnD816IqngSHAdO1T
17uW2AUXd4qiAxA92aNT2gFHcv6v8sMDoPjmiqGp//b6FoQXJ50gtAk6cXJrrJV6
rc2DhXJQ8ozt8bk/Da6FxnFkQBjIfzGvdkMbloBm2E4buwidoMPy6vV0quYyglCq
ybKlAgMBAAGjYDBeMB8GA1UdIwQYMBaAFDynch79GJ76HD8gT3AK+lI6SYQGMB0G
A1UdDgQWBBQyYJ3z/WNlqJPGvUxL1Mns7LftzzAMBgNVHRMBAf8EAjAAMA4GA1Ud
DwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAQEAQWGd6zY51VyKERd0oZRKI6cU
Xgdt4lLIUhxHgomyY1KPo6hElejVV5eHwap2Az/MmJP8eivHUPrnzXnm8tMK3RDR
BDQqOMXSjndBo+Msa/vuSbOkHdYsMIYEZcFxdPQXZuiRLAgJmwWDOMuL4rX9vy6i
hLus+uL8s1R96eqypEP3Ym1PZV8UKY1oCRjiDI86PqcSG7dFKwGDm4yZm307mwwW
GIbQfSZen1WbJl3/jUKIMzcjoxMUlY14gl4N7ilJ56d+ZrjN8KHJ3iQe3QzbSx6q
gSG2Vb3y722iCWs5nNlmMKl//3rcdnwEvPUn7vUTpEDvB2xITWihGj2Ik9PzVA==
-----END CERTIFICATE-----
)KEY";

/* Declare Device private key*/
static const char AWS_CERT_PRIVATE[] PROGMEM = R"KEY(
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA0FLM5j5lOyffkY8BdnFYg9wuos8XOI3r1qcND2GpNgEfJpgA
H2l+JNQUUf9aPShw/8cV1XCUy9A5+gCbpsa7kznso3z3poLEfHJN8gwRKAYs/Exi
d70HMAvKKFiSXJTUR+1QHEDiagZG//ip+C2Juese5x4lsLkOqqhy+r1EN3nrnnBh
5PokN2YrVFl5C15415w/NeiKp4EhwHTtU9e7ltgFF3eKogMQPdmjU9oBR3L+r/LD
A6D45oqhqf/2+haEFyedILQJOnFya6yVeq3Ng4VyUPKM7fG5Pw2uhcZxZEAYyH8x
r3ZDG5aAZthOG7sInaDD8ur1dKrmMoJQqsmypQIDAQABAoIBAGV1ThF8pfTPkJTl
nwK+ZSujGpt0XIzQoeGi7jtlhvGkTjWPpc+moybwmwzsXliWz6HipgGTmQRCX1og
3a218Djd5yAghsRzv5oUWV3e/qQNje86jGJgj5WYyFYp/O5WFaUKMQ/xkdOtRvr3
cmBKXV9M4XoSNq0BE+GNtKHld8nEF3SwJ1lHeqOQXp7a6Br6uYl/BmK8g7N6Ro4O
sjGPTKdaiCVuuvPBSXDDiga9dhxtXPXP3PbGszlXQlvoqF+67e6ewQLgFiQbMoB7
mHJWVro/HvGfqO9MpC9fpC+ce+gBNDatmLfW7BXAzT3YngutulpKRYDkEfs60MG4
VRrEtykCgYEA+6OjCPgsiaV8LSdXzuU5bpuXTg27efN/ovJDICTt1zb6N09/Fydn
F8t98BUU1pugVbN1QijGSgjX+9kjzbKPebas69B22ArOVytMQTeAKI56Kn+TrQJx
sx54xMxipG31CheXsY9ExLBq/56jLN0iZYFupAlkFe/VmIJwbHrgoAsCgYEA0+7/
v4tlGL2un444KiRTTGLdyWB9OBmkeQMOVSVG6amtlpmazM7W1O5piY1X99JftuaK
FuHZ0R0KUJSBVZDXR+XrctH8mjzcPXAIm+LxAB02U0gBepi7PFy0hHqNLKzpirCR
p0EpIxM91H7SE6/6AaPmBv21wRgySzqsHrZaNg8CgYAmEfSpd7ptPK8Tub8MGxvc
QwfaFDPH2HH3+gTzyQJ+q9+hHJLSsvBi5jNwbhAQA813CcZ0suyE6N+cR5amGRyh
wmRY7Nn+B2x+PZu0xivKdvu+kDyMUTFYcwS8aVuHGueWlkkp4M37n+EgOSTgtbft
eW5+vLj6pKVBBILztodjTwKBgCiwC72UX3ZehDXxseq1SqCxom7U7XVlxuPMqGXE
YFbf0onFN6j2VNxQYUadMjRL2UBeBkjaV10EPES4HhR1WD9fbtJ+agaahJXu+lgj
O62P7iwS+OW2iMvP6IA+nvfiwntz5qK7qdAoE4jGSEKrWE4UT0csUkaeBJnYy86h
p7QVAoGBAK16AyiLEm3v2J2diam6t8YdWwh6w9VTnsy37B2vduze4PUnQoLXMKuz
Ladmy8KhVso+WwsVeX0+3iNTOIrcHmVA4iDKgb+TcvPHrdstHwkLjP6SXLu3+YFY
TFN/IyawtIPWmC9D0jpCb6XogduwMFeesJzRCEwr51YUaD4Q0MPL
-----END RSA PRIVATE KEY-----
)KEY";
