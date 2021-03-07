[Defines]
  PLATFORM_NAME                  = S3030Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = S3030Pkg/S3030Pkg.fdf


################################################################################
#
# Components Section - list of all EDK II Modules needed by this Platform
#
################################################################################
[Components.common]
	MdePkg\Library\BasePrintLib\BasePrintLib.inf
	MdePkg\Library\BasePeCoffLib\BasePeCoffLib.inf
	MdePkg\Library\BaseUefiDecompressLib\BaseUefiDecompressLib.inf
	EmbeddedPkg\Library\PrePiLib\PrePiLib.inf
	MdePkg\Library\BaseMemoryLib\BaseMemoryLib.inf
	MdeModulePkg\Library\PeiPerformanceLib\PeiPerformanceLib.inf
	ArmPkg\Library\ArmLib\ArmBaseLib.inf
	MdePkg\Library\BaseLib\BaseLib.inf
	EmbeddedPkg\Library\PrePiExtractGuidedSectionLib\PrePiExtractGuidedSectionLib.inf
	IntelFrameworkModulePkg\Library\LzmaCustomDecompressLib\LzmaCustomDecompressLib.inf
	IntelFrameworkModulePkg\Library\LzmaCustomDecompressLib\LzmaArchCustomDecompressLib.inf
	EmbeddedPkg\Library\PrePiMemoryAllocationLib\PrePiMemoryAllocationLib.inf
