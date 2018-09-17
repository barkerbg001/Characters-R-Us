unit BGBInformer_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Sockets, OleCtrls, SHDocVw,
  CheckLst, Calculator_u, ToolWin, MPlayer, ShellAPI;

type
  TfrmBGBInformer = class(TForm)
    pgcntrlBGBInformer: TPageControl;
    tbshtWelcome: TTabSheet;
    tbshtCharacters: TTabSheet;
    tbshtHelp: TTabSheet;
    tbshtDefinitions: TTabSheet;
    tbshtVideos: TTabSheet;
    tbshtPictures: TTabSheet;
    tbshtFarewell: TTabSheet;
    memoMessages: TMemo;
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
    grpbxCharacters: TGroupBox;
    cbbCharacters: TComboBox;
    grpbxPicturesChoice: TGroupBox;
    cbbPicturesChoice: TComboBox;
    rgpPicturesOptions: TRadioGroup;
    imgPictureDisplay: TImage;
    memoFarewellMessage: TMemo;
    imgFarewell: TImage;
    btnClose: TButton;
    grpbxVideoTitle: TGroupBox;
    pnlVideoTitle: TPanel;
    pnlMiddle: TPanel;
    grpbxBottom: TGroupBox;
    btbtnLoad: TBitBtn;
    mdplyrMPlayer: TMediaPlayer;
    rgpOptions: TRadioGroup;
    dlgOpenMedia: TOpenDialog;
    grpbxWelcome: TGroupBox;
    imgWelcome: TImage;
    rgpWelcomeOptions: TRadioGroup;
    tbshtGames: TTabSheet;
    memoGames: TMemo;
    btbtnLoadPicture: TBitBtn;
    pnlLeftPicture: TPanel;
    pnlRightPicture: TPanel;
    grdpnlGameSelection: TGridPanel;
    btbtnTetris: TBitBtn;
    btbtnPacman: TBitBtn;
    btbtnSonic: TBitBtn;
    btbtnSnakes: TBitBtn;
    btbtnBackToStart: TBitBtn;
    btbtnHelp: TBitBtn;
    btbtnClose: TBitBtn;
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
    procedure btbtnLoadClick(Sender: TObject);
    procedure btbtnLoadPictureClick(Sender: TObject);
    procedure rgpOptionsClick(Sender: TObject);
    procedure btbtnTetrisClick(Sender: TObject);
  private
    { Private declarations }
    procedure tabInVisible;
    procedure closeApp;
    procedure backToStart;
    procedure helpPage;
    procedure picturePage;
    procedure calculatorPage;
    procedure gamesPage;
    procedure videosPage;
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
  tbshtWelcome.Show;
end;

procedure TfrmBGBInformer.btbtnBackToCharactersPageClick(Sender: TObject);
begin
  tbshtWelcome.TabVisible:= False;
  tbshtHelp.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtGames.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
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

procedure TfrmBGBInformer.btbtnLoadClick(Sender: TObject);
begin
  if (dlgOpenMedia.Execute) then
 begin
   mdplyrMPlayer.FileName:= dlgOpenMedia.FileName;
   pnlVideoTitle.Caption:= ExtractFileName(dlgOpenMedia.FileName);
   mdplyrMPlayer.Open;
 end;
end;

procedure TfrmBGBInformer.btbtnLoadPictureClick(Sender: TObject);
var
  iRandom: Integer;
  sPicture: string;
begin
  sPicture:= cbbPicturesChoice.Text;

  if sPicture = ''
  then begin
         ShowMessage('Please choose a option');
         Exit;
       end;


  Randomize;
  iRandom:= Random(36)+1;
  loadPicture(sPicture,iRandom);
end;

procedure TfrmBGBInformer.btbtnTetrisClick(Sender: TObject);
begin
  ShellExecute(0,'open',PChar('Tetris.bat'),nil,nil,SW_HIDE);
end;

procedure TfrmBGBInformer.btnCloseClick(Sender: TObject);
var
  sName, sMessage: string;
begin
  ShowMessage('Please tell me how I can improve this product.');
  sName:= InputBox('Name','Please enter your name:','');
  sMessage:= InputBox('Message','Please tell me how to improve this product.','');
  tcpsrvrDefinitions.Close;
  Close;
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
  frmCalculator.ShowModal;
  backToStart;
end;

procedure TfrmBGBInformer.gamesPage;
begin
  tbshtGames.Show;
end;

procedure TfrmBGBInformer.cbbCharactersChange(Sender: TObject);
var
  sCharacter, sParthTextfile, sParthPicture: string;
begin
  sCharacter:= cbbCharacters.Text;

  sParthTextFile:= 'Character/Textfile/'+ sCharacter + '.txt';
  sParthPicture:= 'Character/Pictures/'+ sCharacter + '.bmp';

  //Code to check if textfile exist
  AssignFile(TF, sParthTextfile);
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
  if FileExists(sParthPicture)
  then begin
         //Code to load image into image component (imgCharacter)
         imgCharacter.Picture.LoadFromFile(sParthPicture);
       end
       else
       begin
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
  tbshtCharacters.Show;
end;

procedure TfrmBGBInformer.closeApp;
var
  sParthPicture: string;
begin
  tbshtFarewell.Show;

  sParthPicture:= 'Pictures/Farewell.bmp';

  //Code to check if image exist
  if FileExists(sParthPicture)
  then begin
         //Code to load image into image component (imgCharacter)
         imgFarewell.Picture.LoadFromFile(sParthPicture);
       end
       else begin
              imgFarewell.Picture.LoadFromFile('Character/Error.bmp');
            end;
end;

procedure TfrmBGBInformer.definitionPage;
begin
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
  tabInVisible;
  backToStart;
end;

procedure TfrmBGBInformer.FormCreate(Sender: TObject);
var
  slDefinitionItems, slCharacterItems, slPictureItems: TStringList;
  slDefinitionsList, slCharacterList, slPictureList: TStringList;
  sType, sCheck: string;
  iPos: Integer;
begin
  //List all the Files contained in the definitions folder
  slDefinitionsList := TStringList.Create;
  try
    FindFiles('htdocs/', '*.html',slDefinitionsList);

    slDefinitionsList.SaveToFile('Lists/DefinitionList.txt');

    //ShowMessage('Files found: ' + IntToStr(slDefinitionsList.Count));
  finally
    slDefinitionsList.Free;
  end;

  //List all the Files contained in the characters folder
  slCharacterList := TStringList.Create;
  try
    FindFiles('Character/Textfile/', '*.txt',slCharacterList);

    slCharacterList.SaveToFile('Lists/CharacterList.txt');

    //ShowMessage('Files found: ' + IntToStr(slCharacterList.Count));
  finally
    slCharacterList.Free;
  end;

  //List all the Files contained in the pictures folder
  slPictureList := TStringList.Create;
  try
    FindFiles('Pictures/', '*.bmp',slPictureList);

    slPictureList.SaveToFile('Lists/PictureList.txt');

    ShowMessage('Files found: ' + IntToStr(slPictureList.Count));
  finally
    slPictureList.Free;
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

  //Assigns items in textfile PictureList.txt to combobox cbbPicture
  slPictureItems:= TStringList.Create;

  AssignFile(TF, 'Lists/PictureList.txt');
  try
     Reset(TF);
  except
     ShowMessage('Sorry, the text file does not exist in this folder.');
     Exit;
  end;

  while not Eof(TF) do
    begin
      Readln(TF, sOneLine);

      //Copys everything before "("
      iPos:= Pos(' (',sOneLine);
      sType:= Copy(sOneLine,1,iPos-1);
      Delete(sOneLine,1,iPos);

      //Copys everything after "\"
      iPos:= Pos('\',sType);
      sOneLine:= Copy(sType,iPos+1,Length(sType));
      Delete(sType,1,iPos);

      //Copys everything after "\"
      iPos:= Pos('\',sOneLine);
      sType:= Copy(sOneLine,iPos+1,Length(sOneLine));
      Delete(sOneLine,1,iPos);

      slPictureItems.Sorted:= True;
      slPictureItems.Duplicates := dupIgnore;

      if sType = ''
      then begin
             Continue;
           end
           else begin
                  slPictureItems.Add(sType)
                end;
    end;
  CloseFile(TF);

  cbbPicturesChoice.Items.AddStrings(slPictureItems);

  slPictureItems.Free;
end;

procedure TfrmBGBInformer.helpPage;
begin
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
end;

procedure TfrmBGBInformer.picturePage;
begin
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

  rgpCharacterOptions.ItemIndex:= -1;
end;

procedure TfrmBGBInformer.rgpOptionsClick(Sender: TObject);
begin
  case rgpOptions.ItemIndex of
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

  rgpOptions.ItemIndex:= -1;
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

  rgpOptionsDefinition.ItemIndex:= -1;
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

  rgpPicturesOptions.ItemIndex:= -1;
end;

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
       videosPage;
     end;
  4: begin
       gamesPage;
     end;
  5: begin
       calculatorPage;
     end;
  6: begin
       picturePage
     end;
  7: begin
       closeApp;
     end;
  end;

  rgpWelcomeOptions.ItemIndex:= -1;
end;

procedure TfrmBGBInformer.tabInVisible;
begin
  tbshtWelcome.TabVisible:= False;
  tbshtHelp.TabVisible:= False;
  tbshtGames.TabVisible:= False;
  tbshtVideos.TabVisible:= False;
  tbshtPictures.TabVisible:= False;
  tbshtFarewell.TabVisible:= False;
  tbshtCharacters.TabVisible:= False;
  tbshtDefinitions.TabVisible:= False;
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
  tbshtVideos.Show;
end;

end.
