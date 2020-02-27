--=========================--
--       AK EXTRAS 2       --
-- GERMANTACOS, KILLERWOLF --
--=========================--

--=========================--
--        FUNCTIONS        --
--=========================--

function WeaponFactoryTweakData:akpack2_setup_variants( part, part_table, model, variant_table )
	for id, part_id in pairs(part_table) do
		if self.parts[part_id] then
			self.parts[part_id].texture_variants = self.parts[part_id].texture_variants or {}
			for id, var_id in pairs(variant_table) do
				self.parts[part_id].texture_variants[var_id] = {
					name_id = "bm_w_paint_" .. part .. "_" .. model .. "_" .. (var_id),
					desc_id = "bm_w_paint_" .. part .. "_" .. model .. "_" .. (var_id) .. "_desc",
					texture_bundle_folder = "mods",
					material_config = "units/mods/weapons/wpn_fps_ass_ak_all_" .. model .. "_pts/wpn_fps_ass_ak_all_" .. part .. "_" .. model .. "_" .. (var_id)
				}
			end
		end
	end
end

function WeaponFactoryTweakData:akpack2_setup_overrides( part_type, part_table, base_part, weapon_id )
	for id, part_id in pairs(self[weapon_id].uses_parts) do
		if self.parts[part_id].type == part_type then
			if self.parts[part_id].override and self.parts[part_id].override[base_part] then
				for _, extra_part_id in pairs(part_table) do
					self.parts[part_id].override[extra_part_id] = deep_clone(self.parts[part_id].override[base_part])					
				end
			end
		end
	end
end

Hooks:PostHook( WeaponFactoryTweakData, "init", "AKExtras2Init", function(self)

--=========================--
--          ARRAYS         --
--=========================--

--==========PARTS==========--

ak_parts_barrel_ext_univ = {
	"wpn_fps_ass_ak_all_md_dtk1",
	"wpn_fps_ass_ak_all_md_fhmb",
	"wpn_fps_ass_ak_all_md_jet",
	"wpn_fps_ass_ak_all_md_alpha",
	"wpn_fps_ass_ak_all_md_ivan"
}
ak_parts_barrel_ext_762x39 = {
	"wpn_fps_ass_ak_all_md_dyna",
	"wpn_fps_ass_ak_all_md_venom"
}

ak_parts_pg_bake = {
	"wpn_fps_ass_ak_stamp_762_pg_akm",
	"wpn_fps_ass_ak_stamp_545_pg_ak74",
	"wpn_fps_ass_ak_stamp_366_pg_vpo209_bake",
	"wpn_fps_ass_ak_krink_545_pg_aks74u",
	"wpn_fps_ass_ak_krink_762_pg_akmsu",
	"wpn_fps_ass_ak_stamp_gold_pg_akms"
}

ak_parts_lhg_akm = {
	"wpn_fps_ass_ak_stamp_762_lhg_akm",
	"wpn_fps_ass_ak_stamp_366_lhg_vpo209",
	"wpn_fps_ass_ak_stamp_gold_lhg_akms"
}

ak_parts_uhg_akm = {
	"wpn_fps_ass_ak_stamp_762_uhg_akm",
	"wpn_fps_ass_ak_stamp_366_uhg_vpo209",
	"wpn_fps_ass_ak_stamp_gold_uhg_akm"
}

ak_parts_st_akm = {
	"wpn_fps_ass_ak_stamp_762_st_akm",
	"wpn_fps_ass_ak_stamp_366_st_vpo209",
	"wpn_fps_ass_ak_stamp_gold_st_akm"
}

ak_parts_lhg_ak74 = {
	"wpn_fps_ass_ak_stamp_545_lhg_ak74"
}

ak_parts_uhg_ak74 = {
	"wpn_fps_ass_ak_stamp_545_uhg_ak74"
}

ak_parts_st_ak74 = {
	"wpn_fps_ass_ak_stamp_545_st_ak74"
}

ak_parts_pg_poly = {
	"wpn_fps_ass_ak_stamp_762_pg_ak103",
	"wpn_fps_ass_ak_stamp_545_pg_ak74m",
	"wpn_fps_ass_ak_stamp_556_pg_ak101"
}

ak_parts_lhg_poly = {
	"wpn_fps_ass_ak_stamp_762_lhg_ak103",
	"wpn_fps_ass_ak_stamp_545_lhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_lhg_ak101"
}

ak_parts_uhg_poly = {
	"wpn_fps_ass_ak_stamp_762_uhg_ak103",
	"wpn_fps_ass_ak_stamp_545_uhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_uhg_ak101"
}


ak_parts_st_poly = {
	"wpn_fps_ass_ak_stamp_762_st_uf_ak103",
	"wpn_fps_ass_ak_stamp_545_st_uf_ak74m",
	"wpn_fps_ass_ak_stamp_545_st_ak74_poly",
	"wpn_fps_ass_ak_stamp_556_st_uf_ak101"
}

--=========VARIANTS========--

ak_variants_pg_bake = {
	"fleck",
	"flecky",
	"maadi",
	"black"
}

ak_variants_hg_akm = {
	"hue",
	"red"
}

ak_variants_st_akm = {
	"hue",
	"romyg",
	"red"
}

ak_variants_hg_ak74 = {
	"red"
}

ak_variants_st_ak74 = {
	"red"
}

ak_variants_all_poly = {
	"plum",
	"border",
	"od",
	"sand"
}

--=========================--
--      COMPATIBILITY      --
--=========================--

if BeardLib.Utils:FindMod("AKM") then
	table.insert(ak_variants_pg_bake, "akm")
	self:akpack2_setup_overrides( "barrel2", ak_parts_barrel_ext_762x39, "wpn_fps_upg_ass_ns_battle", "wpn_fps_ass_ak_stamp_762" )
	self:akpack2_setup_overrides( "barrel2", ak_parts_barrel_ext_univ, "wpn_fps_upg_ass_ns_battle", "wpn_fps_ass_ak_stamp_762" )
end

if BeardLib.Utils:FindMod("AK-74") then
	table.insert(ak_variants_pg_bake, "ak74")
end

if BeardLib.Utils:FindMod("VPO-209") then
	table.insert(ak_variants_pg_bake, "vpo209")
end

if BeardLib.Utils:FindMod("AKS-74U") then
	table.insert(ak_variants_pg_bake, "aks74u")
end

if BeardLib.Utils:FindMod("AKMSU") then
	table.insert(ak_variants_pg_bake, "akmsu")
end

--=========================--
--          SETUP          --
--=========================--

self:akpack2_setup_variants( "pg", ak_parts_pg_bake, "akm", ak_variants_pg_bake )
self:akpack2_setup_variants( "lhg", ak_parts_lhg_akm, "akm", ak_variants_hg_akm )
self:akpack2_setup_variants( "uhg", ak_parts_uhg_akm, "akm", ak_variants_hg_akm )
self:akpack2_setup_variants( "st", ak_parts_st_akm, "akm", ak_variants_st_akm )
self:akpack2_setup_variants( "lhg", ak_parts_lhg_ak74, "ak74", ak_variants_hg_ak74 )
self:akpack2_setup_variants( "uhg", ak_parts_uhg_ak74, "ak74", ak_variants_hg_ak74 )
self:akpack2_setup_variants( "st", ak_parts_st_ak74, "ak74", ak_variants_st_ak74 )

end)