dnl
include(`foreach.m4')dnl
dnl
include(`common.m4')dnl
dnl
include(`datatypes.m4')dnl
dnl
define(`TOHWM4_metadata_sub',`dnl
   subroutine cmlAddMetadata$1(xf, name, content, convention, dictRef, id, title dnl
ifelse(substr($1,0,4),`Real',`,fmt)',`)')
    type(xmlf_t), intent(inout) :: xf
    character(len=*), intent(in) :: name
    TOHWM4_declarationtype($1), intent(in) :: content
    character(len=*), intent(in), optional :: convention
    character(len=*), intent(in), optional :: dictRef
    character(len=*), intent(in), optional :: id
    character(len=*), intent(in), optional :: title
dnl
ifelse(substr($1,0,4),`Real',`dnl 
    character(len=*), intent(in), optional :: fmt
')dnl

    call xml_NewElement(xf, "metadata")
    call xml_AddAttribute(xf, "name", name)
    call xml_AddAttribute(xf, name="content", value=content dnl
ifelse(substr($1,0,4),`Real',`,fmt=fmt',`') dnl
)
    if (present(dictref)) call xml_AddAttribute(xf, "dictRef", dictref)
    if (present(id)) call xml_AddAttribute(xf, "id", title)
    if (present(title)) call xml_AddAttribute(xf, "title", title)
    if (present(convention)) call xml_AddAttribute(xf, "convention", convention)
    call xml_EndElement(xf, "metadata")

   end subroutine cmlAddMetadata$1
')dnl
dnl
dnl
! This file is AUTOGENERATED!!!!
! Do not edit this file; edit m_wcml_metadata.m4 and regenerate.
!

module m_wcml_metadata

  use m_common_realtypes, only: sp, dp
  use FoX_wxml, only: xmlf_t
  use FoX_wxml, only: xml_NewElement, xml_EndElement
  use FoX_wxml, only: xml_AddAttribute

  implicit none
  private

  interface cmlAddMetadata
    m4_foreach(`x', TOHWM4_types, `TOHWM4_interfacename(cmlAddMetadata, x)
')dnl
  end interface

  public :: cmlAddMetadata

contains

m4_foreach(`x', TOHWM4_types, `TOHWM4_metadata_sub(x)
')

end module m_wcml_metadata
