program winff_new;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, umain, upreseteditor, uexportpreset, upreferences, uabout, ucmdlinedialog, uaddfilesdialog, usplashdialog
  { you can add units after this };

{$IFDEF WINDOWS}{$R winff_new.rc}{$ENDIF}

begin
   Application.Initialize;
   //Slash screen code start
   SplashDialog := TSplashDialog.Create(Application);
   SplashDialog.Show;
   while SplashDialog.SplashTimer.Enabled do
      Application.ProcessMessages;
   //Splash screen code end
   Application.CreateForm(TMainForm, MainForm);
   Application.Title := MainForm.Caption;
   Application.CreateForm(TPresetEditorDialog, PresetEditorDialog);
   Application.CreateForm(TExportPresetDialog, ExportPresetDialog);
   Application.CreateForm(TPreferencesDialog, PreferencesDialog);
   Application.CreateForm(TAboutDialog, AboutDialog);
   Application.CreateForm(TCmdLineDialog, CmdLineDialog);
   Application.CreateForm(TAddFilesDialog, AddFilesDialog);
   //Splash screen cleanup start
   SplashDialog.Hide;
   SplashDialog.Free;
   //Splash screen cleanup end
   Application.Run;
end.

