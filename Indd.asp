<!--#include file="jsonparser.asp"-->
<%
On Error Resume Next
Dim JsonString,name,phone,country_code,text
Set JsonParser = New aspJSON
jsonstring=request.queryString("Data")
JsonParser.loadJSON(jsonstring)
Response.Write JsonParser.data("name")
Set pload=JsonParser.data("payload")
phone=pload.item("sender").item("phone")
name=pload.item("sender").item("name")
country_code=pload.item("sender").item("country_code")
text=pload.item("payload").item("text")


Dim url
url="http://localhost:8080/imangi?name=" & name & "&phone="&phone& "&country_code="&country_code& "&text="&text
Dim xmlreq : Set xmlreq= Server.CreateObject("MSXML2.ServerXMLHTTP.3.0")
    xmlreq.open "GET",url , false
    xmlreq.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
    xmlreq.send "hello"
    If xmlreq.Status = 200 Then
       Response.Write xmlreq.ResponseText
    Else
	 Response.Status=502
	 Response.Write "Unable to process data on Main Application"
    End If
If Err.Number <> 0 Then
	  Response.Status=400
	 Response.Write "Unable to process data Proxy"

End If

On Error GoTo 0

%>

