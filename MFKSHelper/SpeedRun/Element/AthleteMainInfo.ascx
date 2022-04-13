<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteMainInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteMainInfo" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<dx:ASPxComboBox 
                            ID="cbAthleteList" 
                            ClientInstanceName="cbAthleteList" 
                            runat="server" 
                            ValueField="ID" 
                            TextField="Name" 
                            Width="100%"  
                            AutoPostBack="false"
                            DataSourceID="dsAthleteList" 
                            ValueType="System.Int32" 
                            Caption="Спортсмены"
                            SelectedIndex="0"
                            >
                            <ClientSideEvents SelectedIndexChanged="function(s,e){ cbPanel.PerformCallback('refreshAthlete'); }" />
                        </dx:ASPxComboBox>
                        <br />
                        <dx:ASPxComboBox ID="cbAthleteKindOfSportList" 
                            ClientInstanceName="cbAthleteKindOfSportList" 
                            runat="server" 
                            ValueField="KindOfSportID" 
                            TextField="Name" 
                            Width="100%"  
                            AutoPostBack="false"
                            DataSourceID="dsAthleteKindOfSportList" 
                            SelectedIndex="0" 
                            Caption="Вид спорта"
                            >
                            <ClientSideEvents SelectedIndexChanged="function(s,e){ cbPanel.PerformCallback('refreshKindOfSport'); }" />
                        </dx:ASPxComboBox>


            <asp:SqlDataSource runat="server" ID="dsAthleteKindOfSportList" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="GetAthleteKindOfSportList" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteKindOfSportList_Selecting" >
                <SelectParameters>
                    <asp:Parameter Name="AthleteID" />
                    <asp:Parameter Name="Lang" DefaultValue="Rus" />
                    <asp:Parameter Name="IsFilter" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource runat="server" ID="dsAthleteList" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="select ID, dbo.GetFIO(Last_name, First_name, Pat_name) as Name from dbo.Athletes
where FirmID = @FirmID and year(Date_of_firm_entered) = 2021
Order by Name" OnSelecting="dsAthleteList_Selecting" >
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="FirmID" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>