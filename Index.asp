<!--#include file="jsonparser.asp"-->
<%
On Error Resume Next 
Dim JsonString,name,phone,country_code,text
Set JsonParser = New aspJSON
jsonstring=request.queryString("Data")
if jsonstring is NONE then
	Response.Write "NO DATA FOUND"
end if
JsonParser.loadJSON(jsonstring)
Response.Write JsonParser.data("name")
Set pload=JsonParser.data("payload")
phone=pload.item("sender").item("phone")
name=pload.item("sender").item("name")
country_code=pload.item("sender").item("country_code")
text=pload.item("payload").item("text")
Response.Write pload.item("sender").item("name")
Response.Write phone
Response.Redirect "http://localhost:8080/imangi?phone="& phone &"&name="& name &"&country_code"& country_code &"&text="&text

If Err.Number <> 0 Then

  Response.Write (Err.Description)   

  Response.End 

End If

On Error GoTo 0
%>

