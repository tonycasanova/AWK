# Tony Casanova 
# Decode /proc/iomem - tested with output from Odroid HC-1

BEGIN{
FS="|"
}

{

#printf("BODY: %s\n", $0)

# %2F

#+%3A+ is a :
# +%3A+
#gsub(/+%3A\+/,":",$0)
gsub(/+%3A\+/,"|",$0)

# PCI :
# PCI+Bus+0000%3A02
gsub(/PCI[+]Bus[+]/,"PCI_Bus_",$0)
#gsub(/%3A/,"_",$0)

#%2F is a /

gsub(/%2F/,"/",$0)
gsub(/%5B/,"[",$0)
gsub(/%5D/,"]",$0)

gsub("+++","+",$0)

#printf("BODY: %s\n", $0)

gsub("Kernel[+]data","Kernel_data",$0)
gsub("Kernel[+]bss","Kernel_bss",$0)
#gsub("PCI[+]Bus","PCI_Bus",$0)
#gsub("PCI[+]MMCONFIG","PCI_MMCONFIG",$0)
#gsub("vmwgfx[+]probe","vmwgfx_probe",$0)
#gsub("Video[+]ROM","Video_ROM",$0)
#gsub("Adapter[+]ROM","Adapter_ROM",$0)
#gsub("Local[+]APIC","Local_APIC",$0)
#gsub("Crash[+]kernel","Crash_kernel",$0)
#gsub("ACPI[+]Tables","ACPI_Tables",$0)
#gsub("ACPI[+]Non-volatile[+]Storage","ACPI_Non-volatile_Storage",$0)
##  f0000000-f7ffffff : PCI MMCONFIG 0000 [bus 00-7f]
#gsub("MMCONFIG[+]","MMCONFIG_",$0)
#gsub("0000[+]","0000_",$0)
#gsub("bus[+]","bus_",$0)
##gsub("][+]","]_",$0)
#gsub("pnp[+]","pnp_",$0)
#gsub("IOAPIC[+]","pnp_",$0)
#gsub("HPET[+]","pnp_",$0)



#Kernel+code
gsub_count = gsub("Kernel[+]code","Kernel_code", $0)
# printf("# gsub Kernel+code replacements: %s\n", gsub_count)

# System RAM
gsub_count = gsub("System[+]RAM","System_RAM", $0)
#printf("# gsub System+RAM replacements: %s\n", gsub_count)

# System ROM
gsub_count = gsub("System[+]ROM","System_ROM", $0)
#printf("# gsub System+ROM replacements: %s\n", gsub_count)


# Posibly new line

#gsub(/+/,"\n",$0)
#gsub(/+++/,"+",$0)
#gsub(/+/,"\n",$0)
gsub("+","\n",$0)

gsub_count = gsub(":","|", $0)
#printf("# gsub colon replacements: %s\n", gsub_count)

# %40
gsub_count = gsub(/%40/,"@", $0)
#printf("# gsub @ replacements: %s\n", gsub_count)

#printf("BODY2: %s\n", $0)

#gsub("%2F","/",$0)
#gsub("%40","|",$0)
#gsub(/+%3A\+/,"|",$0)
#printf("\n")
printf("%s\n", $0)
#printf("NF: %s NR: %s Value: %s\n", NF, NR, $0)


}
