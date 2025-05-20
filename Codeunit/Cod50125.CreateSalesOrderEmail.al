codeunit 50125 CreateSalesOrderEmail
{


    trigger OnRun()
    begin

    end;

    procedure CreateEmail(WooCommerceId: Text)
    var
        salesHeader: Record "Sales Header";
        salesLine: Record "Sales Line";
        emailHeader: Record Email;
        emailLines: Record "Email Sales Order Line";
        emailSender: Text;
        emailContent: Text;
        salesOrderId: Code[20];
    begin
        emailSender := 'group1@erpeksamen.dk';
        emailContent := 'We have received your order.';

        salesHeader.Reset();
        salesHeader.SetFilter("WooCommerceOrderID", WooCommerceId);

        if salesHeader.FindFirst() then begin
            salesOrderId := salesHeader."No.";
            Message('Sales header found');


            emailHeader.Init();
            emailHeader.WooCommerceId := salesHeader."WooCommerceOrderID";
            emailHeader.Date := salesHeader."Order Date";
            emailHeader."Customer Name" := salesHeader."Sell-to Customer Name";
            emailHeader.Email := emailSender;
            emailHeader.EmailContent := emailContent;
            emailHeader.Insert();


            salesLine.Reset();
            salesLine.SetRange("Document Type", salesHeader."Document Type");
            salesLine.SetRange("Document No.", salesOrderId);

            if salesLine.FindSet() then begin
                repeat
                    emailLines.Init();
                    emailLines.Id := emailHeader.Id;
                    emailLines."Item No." := salesLine."No.";
                    emailLines."Item Desc" := salesLine.Description;
                    emailLines."Item Quantity" := salesLine.Quantity;
                    emailLines."Unit Amount" := salesLine."Line Amount";
                    emailLines.Insert();
                until salesLine.Next() = 0;
            end;
        end else
            Message('Ingen salgsordre fundet for WooCommerce ID: %1', WooCommerceId);
    end;


}
