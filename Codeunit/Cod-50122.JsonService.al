codeunit 50122 JsonService
{
    procedure GetFieldTextAsText(JsonObject: JsonObject; FieldName: Text): Text;
    var
        JToken: JsonToken;
        ReturnVal: Text;
    begin
        if JsonObject.Get(FieldName, JToken) then
            ReturnVal := JToken.AsValue().AsText();
        exit(ReturnVal);
    end;


    procedure GetFieldAsArray(JsonObject: JsonObject; FieldName: Text): JsonArray
    var
        JToken: JsonToken;
        ReturnVal: JsonArray;
    begin
        if not JsonObject.Get(FieldName, JToken) then
            Error('Field "%1" not found in JSON object.', FieldName);

        if not JToken.IsArray() then
            Error('Field "%1" is not a JSON array.', FieldName);

        ReturnVal := JToken.AsArray();
        exit(ReturnVal);
    end;



    // -------------------------------------------------------------------------------


    procedure GetFieldAsInteger(JsonObject: JsonObject; FieldName: Text): Integer;
    var
        JToken: JsonToken;
        ReturnVal: Integer;

    begin
        if JsonObject.Get(FieldName, JToken) then
            ReturnVal := JToken.AsValue().AsInteger();
        exit(ReturnVal);
    end;


    procedure GetFieldAsDecimal(JsonObject: JsonObject; FieldName: Text): Decimal;
    var
        JToken: JsonToken;
        ReturnVal: Decimal;
    begin
        if JsonObject.Get(FieldName, JToken) then
            ReturnVal := JToken.AsValue().AsDecimal();
        exit(ReturnVal);
    end;


    procedure GetFieldAsDate(JsonObject: JsonObject; FieldName: Text): Date;
    var
        JToken: JsonToken;
        ReturnVal: Date;
    begin
        if JsonObject.Get(FieldName, JToken) then
            ReturnVal := JToken.AsValue().AsDate();
        exit(ReturnVal);
    end;


    procedure GetFieldTextAsJSArray(JsonObject: JsonObject; FieldName: Text): JsonArray;
    var
        JToken: JsonToken;
        ReturnVal: JsonArray;
    begin
        if JsonObject.Get(FieldName, JToken) then
            ReturnVal := JToken.AsArray();
        exit(ReturnVal);
    end;


    procedure GetBodyAsJsonObject(Response: HttpResponseMessage): JsonObject;
    var
        Body: Text;
        JsonBody: JsonObject;
    begin
        Response.Content.ReadAs(Body);
        JsonBody.ReadFrom(Body);
        exit(JsonBody);
    end;



}
