codeunit 50121 NewCustomerWS
{
    TableNo = Customer;

    trigger OnRun()
    begin

    end;

    [ServiceEnabled]
    procedure MyTestProcedure(): Text
    var
        myAnswer: Text[40];
    begin
        myAnswer := 'YES!';
        exit(myAnswer);
    end;


    procedure InsertCustomerWS(customerJson: Text): Boolean
    var
        JsonService: Codeunit JsonService;
        jsonObject: JsonObject;
        customerRec: Record Customer;

    begin
        jsonObject.ReadFrom(customerJson);

        customerRec.Init();
        customerRec.Validate(Name, JsonService.GetFieldTextAsText(jsonObject, 'Name'));
        customerRec.Validate("E-Mail", JsonService.GetFieldTextAsText(jsonObject, 'Email'));
        customerRec.Insert();

        Message('Kunden blev oprettet med nummer: %1', customerRec."No.");

        exit(true);
    end;

}
