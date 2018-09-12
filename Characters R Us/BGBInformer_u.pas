unit BGBInformer_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Sockets, OleCtrls, SHDocVw,
  CheckLst, Calculator_u;

type
  TfrmBGBInformer = class(TForm)
    pgcntrlBGBInformer: TPageControl;
    tbshtWelcome: TTabSheet;
    tbshtCharacters: TTabSheet;
    tbshtHelp: TTabSheet;
    tbshtDefinitions: TTabSheet;
    tbshtWebBrowser: TTabSheet;
    tbshtVideos: TTabSheet;
    tbshtPictures: TTabSheet;
    tbshtFarewell: TTabSheet;
    tbshtCalendar: TTabSheet;
    memoMessages: TMemo;
    rgpWelcomeOptions: TRadioGroup;
    imgCharacter: TImage;
    rchdtCharacter: TRichEdit;
    rgpCharacterOptions: TRadioGroup;
    pnlHelpMessage: TPanel;
    rchdtHelpOutput: TRichEdit;
    grpbxHelpOptions: TGroupBox;
    btbtnHelpFileCharacters: TBitBtn;
    btbtnCloseCharacters: TBitBtn;
    btbtnBackToCharactersPage: TBitBtn;
    grpbxDefinitionMessage: TGroupBox;
    cbbDefinition: TComboBox;
    rgpOptionsDefinition: TRadioGroup;
    wbrDefinitions: TWebBrowser;
    tcpsrvrDefinitions: TTcpServer;
    btnClose: TButton;
    grpbxCharacters: TGroupBox;
    cbbCharacters: TComboBox;
    grpbxPicturesChoice: TGroupBox;
    cbbPicturesChoice: TComboBox;
    rgpPicturesOptions: TRadioGroup;
    imgPictureDisplay: TImage;
    grpbxChooseImage: TGroupBox;
    lstPicturesOptions: TCheckListBox;
    procedure btbtnHelpFileCharactersClick(Sender: TObject);
    procedure btbtnCloseCharactersClick(Sender: TObject);
    procedure btbtnBackToCharactersPageClick(Sender: TObject);
    procedure rgpCharacterOptionsClick(Sender: TObject);
    procedure tbshtDefinitionsShow(Sender: TObject);
    procedure tbshtDefinitionsHide(Sender: TObject);
    procedure tcpsrvrDefinitionsAccept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure cbbDefinitionChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbCharactersChange(Sender: TObject);
    procedure rgpOptionsDefinitionClick(Sender: TObject);
    procedure rgpWelcomeOptionsClick(Sender: TObject);
    procedure rgpPicturesOptionsClick(Sender: TObject);
    procedure lstPicturesOptionsClick(Sender: TObject);
  private
    { Private declarations }
    procedure closeApp;
    procedure backToStart;
    procedure helpPage;
    procedure picturePage;
    procedure calculatorPage;
    procedure calendarPage;
    procedure videosPage;
    procedure webPage;
    procedure definitionPage;
    procedure characterPage;
    procedure loadPicture(sPictures:string; iNumber: Integer);
    procedure FindFiles(StartDir, FileMask: string; FilesList: TStringList);
    function BubbleSort( list: TStringList ): TStringList;
  public
    { Public declarations }
  end;

var
  frmBGBInformer: TfrmBGBInformer;
  TF: TextFile;
  sOneLine: string;
  sLine: string;


implementation

{$R *.dfm}


procedure TfrmBGBInformer.backToStart;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;

  tbshtWelcome.TabVisible:= True;
  tbshtWelcome.Show;
end;

procedure TfrmBGBInformer.btbtnBackToCharactersPageClick(Sender: TObject);
begin
  tbshtWelcome.TabVisible:= False;
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;

  tbshtCharacters.TabVisible:= True;
  tbshtCharacters.Show;
end;

procedure TfrmBGBInformer.btbtnCloseCharactersClick(Sender: TObject);
begin
  closeApp;
end;

procedure TfrmBGBInformer.btbtnHelpFileCharactersClick(Sender: TObject);
begin
  AssignFile(TF, 'HelpFile/Character.txt');
  try
     Reset(TF);
  except
     ShowMessage('Sorry, the text file does not exist in this folder.');
     Exit;
  end;

  while not Eof(TF) do
    begin
      Readln(TF, sOneLine);
      rchdtHelpOutput.Lines.Add(sOneLine);
    end;
  CloseFile(TF);
end;

procedure TfrmBGBInformer.btnCloseClick(Sender: TObject);
begin
  tcpsrvrDefinitions.Close;
end;

function TfrmBGBInformer.BubbleSort(list: TStringList): TStringList;
var
  i, j: Integer;
  temp: string;
begin
  // bubble sort
  for i := 0 to list.Count - 1 do begin
    for j := 0 to ( list.Count - 1 ) - i do begin
      // Condition to handle i=0 & j = 9. j+1 tries to access x[10] which
      // is not there in zero based array
      if ( j + 1 = list.Count ) then
        continue;
      if ( list.Strings[j] > list.Strings[j+1] ) then begin
        temp              := list.Strings[j];
        list.Strings[j]   := list.Strings[j+1];
        list.Strings[j+1] := temp;
      end; // endif
    end; // endwhile
  end; // endwhile
  Result := list;
end;

procedure TfrmBGBInformer.calculatorPage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  frmCalculator.ShowModal;
  backToStart;
end;

procedure TfrmBGBInformer.calendarPage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtCalendar.TabVisible:= True;
  tbshtCalendar.Show;
end;

procedure TfrmBGBInformer.cbbCharactersChange(Sender: TObject);
var
  sCharacter, sParth: string;
begin
  sCharacter:= cbbCharacters.Text;

  sParth:= 'Character/Textfile/'+ sCharacter + '.txt';

  //Code to check if textfile exist
  AssignFile(TF, sParth);
  try
     Reset(TF);

     //Code to read a Textfile into the Richedit component (rchdtCharacter)
     rchdtCharacter.Lines.Clear;
     while not Eof(TF) do
       begin
         Readln(TF, sOneLine);
         rchdtCharacter.Lines.Add(sOneLine);
       end;
     CloseFile(TF);
  except
     ShowMessage('Sorry, the text file does not exist in this folder.');
     Exit;
  end;

  //Code to check if image exist
  try
     //Code to load image into image component (imgCharacter)
     imgCharacter.Picture.LoadFromFile('Character/Pictures/'+ sCharacter + '.bmp');
  except
     ShowMessage('Sorry, the picture does not exist');
     imgCharacter.Picture.LoadFromFile('Character/Error.bmp');
  end;
end;

procedure TfrmBGBInformer.cbbDefinitionChange(Sender: TObject);
var
  sDefinition: string;
begin
  sDefinition:= cbbDefinition.Text;
  wbrDefinitions.Navigate('http://localhost:7777/'+sDefinition+'.html');
end;

procedure TfrmBGBInformer.characterPage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtCharacters.TabVisible:= True;
  tbshtCharacters.Show;
end;

procedure TfrmBGBInformer.closeApp;
begin
  tbshtWelcome.TabVisible:= False;
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtFarewell.TabVisible:= True;
  tbshtFarewell.Show;
end;

procedure TfrmBGBInformer.definitionPage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtDefinitions.TabVisible:= True;
  tbshtDefinitions.Show;
end;

procedure TfrmBGBInformer.FindFiles(StartDir,
  FileMask: string; FilesList: TStringList);
var
  SR: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> '\' then
    StartDir := StartDir + '\';

  { Build a list of the files in directory StartDir
     (not the directories!)                         }

  IsFound :=
    FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
  while IsFound do begin
    FilesList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  // Build a list of subdirectories
  DirList := TStringList.Create;
  IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;
  while IsFound do begin
    if ((SR.Attr and faDirectory) <> 0) and
         (SR.Name[1] <> '.') then
      DirList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  // Scan the list of subdirectories
  for i := 0 to DirList.Count - 1 do
    FindFiles(DirList[i], FileMask, FilesList);

  DirList.Free;
end;

procedure TfrmBGBInformer.FormActivate(Sender: TObject);
begin
  tcpsrvrDefinitions.Open;
end;

procedure TfrmBGBInformer.FormCreate(Sender: TObject);
var
  slDefinitionItems, slCharacterItems, slDefinitionsList, slCharacterList: TStringList;
  sType: string;
  iPos: Integer;
begin
  //List all the Files contained in the definitions folder
  slDefinitionsList := TStringList.Create;
  try
    FindFiles('htdocs/', '*.html',slDefinitionsList);

    slDefinitionsList.SaveToFile('Lists/DefinitionList.txt');

    ShowMessage('Files found: ' + IntToStr(slDefinitionsList.Count));
  finally
    slDefinitionsList.Free;
  end;

  //List all the Files contained in the characters folder
  slCharacterList := TStringList.Create;
  try
    FindFiles('Character/Textfile/', '*.txt',slCharacterList);

    slCharacterList.SaveToFile('Lists/CharacterList.txt');

    ShowMessage('Files found: ' + IntToStr(slCharacterList.Count));
  finally
    slCharacterList.Free;
  end;

  //Assigns items in textfile CharacterList.txt to combobox cbbCharacters
  slCharacterItems:= TStringList.Create;
  AssignFile(TF, 'Lists/CharacterList.txt');
  try
     Reset(TF);
  except
     ShowMessage('Sorry, the text file does not exist in this folder.');
     Exit;
  end;

  while not Eof(TF) do
    begin
      Readln(TF, sOneLine);

      //Copys everything before "."
      iPos:= Pos('.',sOneLine);
      sType:= Copy(sOneLine,1,iPos-1);
      Delete(sOneLine,1,iPos);

      //Copys everything after "\"
      iPos:= Pos('\',sType);
      sOneLine:= Copy(sType,iPos+1,Length(sType));
      Delete(sType,1,iPos);

      slCharacterItems.Add(sOneLine);
    end;
  CloseFile(TF);

  cbbCharacters.Items.AddStrings(BubbleSort(slCharacterItems));

  slCharacterItems.Free;

  //Assigns items in textfile DefinitionList.txt to combobox cbbDefinition
  slDefinitionItems:= TStringList.Create;

  AssignFile(TF, 'Lists/DefinitionList.txt');
  try
     Reset(TF);
  except
     ShowMessage('Sorry, the text file does not exist in this folder.');
     Exit;
  end;

  while not Eof(TF) do
    begin
      Readln(TF, sOneLine);

      //Copys everything before "."
      iPos:= Pos('.',sOneLine);
      sType:= Copy(sOneLine,1,iPos-1);
      Delete(sOneLine,1,iPos);

      //Copys everything after "\"
      iPos:= Pos('\',sType);
      sOneLine:= Copy(sType,iPos+1,Length(sType));
      Delete(sType,1,iPos);

      slDefinitionItems.Add(sOneLine);
    end;
  CloseFile(TF);

  cbbDefinition.Items.AddStrings(BubbleSort(slDefinitionItems));

  slDefinitionItems.Free;
end;

procedure TfrmBGBInformer.helpPage;
begin
  tbshtVideos.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtHelp.TabVisible:= True;
  tbshtHelp.Show;
end;

procedure TfrmBGBInformer.loadPicture(sPictures:string;iNumber: Integer);
var
  sParth: string;
begin
  sParth:=  'Pictures/'+sPictures+'/'+sPictures+' ('+IntToStr(iNumber)+').bmp';
  ShowMessage(sParth);
  If FileExists(sPictures)<> True
       then
        begin
          imgPictureDisplay.Picture.LoadFromFile(sParth);
        end
        else begin
               ShowMessage('Sorry, Picture does not exist in this folder');
               Exit;
             end;

  lstPicturesOptions.Checked[iNumber]:= False;
end;

procedure TfrmBGBInformer.lstPicturesOptionsClick(Sender: TObject);
var
 sLoadPictures: string;
begin
  sLoadPictures:= cbbPicturesChoice.Text;
  if sLoadPictures ='' then
  begin
    ShowMessage('Please Choose a Option');
    Exit;
  end;

  case lstPicturesOptions.ItemIndex of
  0: begin
       loadPicture(sLoadPictures, 1);
     end;
  1: begin
       loadPicture(sLoadPictures, 2);
     end;
  2: begin
       loadPicture(sLoadPictures, 3);
     end;
  3: begin
       loadPicture(sLoadPictures, 4);
     end;
  4: begin
       loadPicture(sLoadPictures, 5);
     end;
  5: begin
       loadPicture(sLoadPictures, 6);
     end;
  6: begin
       loadPicture(sLoadPictures, 7);
     end;
  7: begin
       loadPicture(sLoadPictures, 8);
     end;
  8: begin
       loadPicture(sLoadPictures, 9);
     end;
  9: begin
       loadPicture(sLoadPictures, 10);
     end;
  10: begin
       loadPicture(sLoadPictures, 11);
     end;
  11: begin
       loadPicture(sLoadPictures, 12);
     end;
  12: begin
       loadPicture(sLoadPictures, 13);
     end;
  13: begin
       loadPicture(sLoadPictures, 14);
     end;
  14: begin
       loadPicture(sLoadPictures, 15);
     end;
  15: begin
       loadPicture(sLoadPictures, 16);
     end;
  16: begin
       loadPicture(sLoadPictures, 17);
     end;
  17: begin
       loadPicture(sLoadPictures, 18);
     end;
  18: begin
       loadPicture(sLoadPictures, 19);
     end;
  19: begin
       loadPicture(sLoadPictures, 20);
     end;
  20: begin
       loadPicture(sLoadPictures, 21);
     end;
  21: begin
       loadPicture(sLoadPictures, 22);
     end;
  22: begin
       loadPicture(sLoadPictures, 23);
     end;
  23: begin
       loadPicture(sLoadPictures, 24);
     end;
  24: begin
       loadPicture(sLoadPictures, 25);
     end;
  25: begin
       loadPicture(sLoadPictures, 26);
     end;
  26: begin
       loadPicture(sLoadPictures, 27);
     end;
  27: begin
       loadPicture(sLoadPictures, 28);
     end;
  28: begin
       loadPicture(sLoadPictures, 29);
     end;
  29: begin
       loadPicture(sLoadPictures, 30);
     end;
  30: begin
       loadPicture(sLoadPictures, 31);
     end;
  31: begin
       loadPicture(sLoadPictures, 32);
     end;
  32: begin
       loadPicture(sLoadPictures, 33);
     end;
  33: begin
       loadPicture(sLoadPictures, 34);
     end;
  34: begin
       loadPicture(sLoadPictures, 35);
     end;
  35: begin
       loadPicture(sLoadPictures, 36);
     end;
  end;
end;

procedure TfrmBGBInformer.picturePage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtPictures.TabVisible:= True;
  tbshtPictures.Show;
end;

procedure TfrmBGBInformer.rgpCharacterOptionsClick(Sender: TObject);
begin
  case rgpCharacterOptions.ItemIndex of
  0: begin

     end;
  1: begin

     end;
  2: begin
       helpPage;
     end;
  3: begin
       backToStart;
     end;
  4: begin
       closeApp;
     end;
  end;
end;

procedure TfrmBGBInformer.rgpOptionsDefinitionClick(Sender: TObject);
begin
  case rgpOptionsDefinition.ItemIndex of
  0: begin
       backToStart;
     end;
  1: begin
       helpPage;
     end;
  2: begin
       closeApp;
     end;
  end;
end;
procedure TfrmBGBInformer.rgpPicturesOptionsClick(Sender: TObject);
begin
  case rgpPicturesOptions.ItemIndex of
  0: begin
       backToStart;
     end;
  1: begin
       helpPage;
     end;
  2: begin
       closeApp;
     end;
  end;
end;

{Characters
Definitions
Help
Surf The Web
Watch The Videos
Calender
Calculator
Pictures
Exit}
procedure TfrmBGBInformer.rgpWelcomeOptionsClick(Sender: TObject);
begin
  case rgpWelcomeOptions.ItemIndex of
  0: begin
       characterPage;
     end;
  1: begin
       definitionPage;
     end;
  2: begin
       helpPage;
     end;
  3: begin
       webPage;
     end;
  4: begin
       videosPage;
     end;
  5: begin
       calendarPage;
     end;
  6: begin
       calculatorPage;
     end;
  7: begin
       picturePage;
     end;
  8: begin
       closeApp;
     end;
  end;
end;

procedure TfrmBGBInformer.tbshtDefinitionsHide(Sender: TObject);
begin
  tcpsrvrDefinitions.Close;
end;

procedure TfrmBGBInformer.tbshtDefinitionsShow(Sender: TObject);
begin
  tcpsrvrDefinitions.Open;
end;

procedure TfrmBGBInformer.tcpsrvrDefinitionsAccept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  Path: string;
  HTTPPos: Integer;
begin
  sLine:= ' ';

  while ClientSocket.Connected and (sLine <> '') do
  begin
    sLine:= ClientSocket.Receiveln();

    if Copy(sLine,1,3) = 'GET' then
    begin
      HTTPPos:= Pos('HTTP',sLine);

      Path:= Copy(sLine, 5, HTTPPos - 6);
    end;
  end;

  if Path = '/' then
     Path:= 'index.html';

  if FileExists('htdocs/' + Path) then
   with TStringList.Create do
   begin
     LoadFromFile('htdocs/' + Path);
     ClientSocket.Sendln('HTTP/1.0 200 OK');
     ClientSocket.Sendln('');
     ClientSocket.Sendln(Text);
     ClientSocket.Close;

     Free;
     Exit;
   end;

  ClientSocket.Sendln('HTTP/1.0 404 Not Found');
  ClientSocket.Sendln('');
  ClientSocket.Sendln('<h1>404 Not Found</h1><br><br>Path: ' + Path);
  ClientSocket.Close;
end;

procedure TfrmBGBInformer.videosPage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
  tbshtWebBrowser.TabVisible:= False;

  tbshtVideos.TabVisible:= True;
  tbshtVideos.Show;
end;

procedure TfrmBGBInformer.webPage;
begin
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtWelcome.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCalendar.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;

  tbshtWebBrowser.TabVisible:= True;
  tbshtWebBrowser.Show;
end;

end.
