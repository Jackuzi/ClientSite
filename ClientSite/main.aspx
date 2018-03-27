<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="_Default" Async="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdateProgress runat="server" id="PageUpdateProgress">
            <ProgressTemplate>
                Loading...
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel runat="server" id="Panel">
            <ContentTemplate>
                        <div class="table-responsive">
         <table class="table">
                <asp:Repeater ID="RepeaterAlbums" runat="server">
                    <HeaderTemplate>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Author Name</th>
                            <th scope="col">Date Added</th>
                           
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                          <td>
                                <asp:Label ID="LabelMessageID" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </td>
                              <td>
                                <asp:Label ID="LabelName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("AuthorName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelDate" runat="server"  Text='<%# Eval("DateAdded", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </td>              
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
