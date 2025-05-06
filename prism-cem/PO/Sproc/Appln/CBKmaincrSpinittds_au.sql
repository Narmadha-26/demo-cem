/*$File_version=MS4.3.0.01$*/
/*filename = CBKmaincrSpinittds_au.sql*/
/********************************************************************************/
/* Procedure					: CBKmaincrSpinittds_au							*/
/* Description					: 												*/
/********************************************************************************/
/* Project						: ADECCO										*/
/* EcrNo						: CBK_ECR_00004									*/
/* Version						: 1.0											*/
/********************************************************************************/
/* Referenced					: 												*/
/* Tables						: 												*/
/********************************************************************************/
/* Development history			: 												*/
/********************************************************************************/
/* Author						: Rajkumar S									*/
/* Date							: Jan  6 2020 11:27PM							*/
/********************************************************************************/
/* Modification History			: 												*/
/********************************************************************************/
/*	modified by				Date					Description					*/
/* Sreenivasa Kumar Reddy.V		13-Sep-2023			TSIH-2171					*/
/********************************************************************************/

create or alter Procedure CBKmaincrSpinittds_au
	@ctxt_ouinstance     	ctxt_ouinstance, --Input 
	@ctxt_user           	ctxt_user, --Input 
	@ctxt_language       	ctxt_language, --Input 
	@ctxt_service        	ctxt_service, --Input 
	@m_errorid           	int output --To Return Execution Status
as
Begin
	-- nocount should be switched on to prevent phantom rows
	Set nocount on
	-- @m_errorid should be 0 to Indicate Success
	Set @m_errorid = 0

	--declaration of temporary variables


	--temporary and formal parameters mapping

	Set @ctxt_ouinstance  = @ctxt_ouinstance
	Set @ctxt_user        = ltrim(rtrim(@ctxt_user))
	Set @ctxt_language    = @ctxt_language
	Set @ctxt_service     = ltrim(rtrim(@ctxt_service))

	--null checking

	IF @ctxt_ouinstance = 915
		Select @ctxt_ouinstance = null  

	IF @ctxt_user = '~#~' 
		Select @ctxt_user = null  

	IF @ctxt_language = 915
		Select @ctxt_language = null  

	IF @ctxt_service = '~#~' 
		Select @ctxt_service = null  

	Select	isnull(ltrim(rtrim(parameter_text)),'') 'tds_autoadust'
	From	fin_quick_code_met (nolock)
	Where	component_id 		=	'CDI'
	And		parameter_type		=	'COMBO'	
	And		parameter_category	=	'YESNO'	
	--Code Modified By Reddy For The ITS ID - TSIH-2171 Starts
	--And		parameter_code		in ('Y','N')
	And		parameter_code		in ('Y')
	--Code Modified By Reddy For The ITS ID - TSIH-2171 Ends
	And		language_id			=	@ctxt_language	

	/* 
	--OutputList
		Select
		null 'tds_autoadust', 
	*/
	
Set nocount off

End


