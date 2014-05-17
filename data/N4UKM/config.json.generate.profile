cat << CTAG
{
    name:PROFILE,
    elements:[
		{ STitleBar:{
			title:"Configuration Profiles"
		}},
			{ SOptionList:{
				title:"Selected Profile",
				description:"Choose the settings backup you want and apply your choice in Synapse before using the action buttons below.",
				action:"restorebackup pickconfig",
				default:"None",
				values:[ "None",
					`for BAK in \`/data/N4UKM/actions/restorebackup listconfig\`; do
						echo "\"$BAK\","
					done`
				]
			}},
		{ STitleBar:{
			title:"Profile Actions",
		}},
			{ SButton:{
				label:"Restore Selected Profile",
				action:"restorebackup applyconfig"
			}},
			{ SButton:{
				label:"Delete Selected Profile",
				action:"restorebackup delconfig",
				notify:[
					{
						on:APPLY,
						do:[ RESET, REFRESH ],
						to:"restorebackup pickconfig"
					}
				]
			}},
		{ SPane:{
			title:"Backup Actions"
		}},
			{ SGeneric:{
				title:"Backup Name",
				default:"None",
				action:"generic /data/N4UKM/files/bck_prof",
			}},
			{ SDescription:{
				description:"First set a name above and apply. After this you can press the Backup Current Profile button below."
			}},
			{ SButton:{
				label:"Backup Current Profile",
				action:"restorebackup keepconfig",
				notify:[
					{
						on:APPLY,
						do:[ REFRESH, APPLY ],
						to:"generic /data/N4UKM/files/bck_prof"
					}
				]
			}},
		{ SPane:{
			title:"General Actions",
			description:"To update/refresh lists, select Restart Synapse below."
		}},
			{ SButton:{
				label:"Restart Synapse",
				action:"restorebackup restart"
			}},
    ]
}
CTAG
