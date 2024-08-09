[DCC.dbo.CabCounts_SingleProdDate]
	
	[DCC].[dbo].[vDCC_quickFQACount_wUnScan_HistoryLast30] 
		-- DCC.dbo.DCC_ScanPoint_Log
		
		DCC.dbo.vGetCatalogByOrdID 
			-- inSight.dbo.OrderLineProduct
		
		DCC.dbo.vCabCountByOlnID
			synSalesOrderLines (Report.vwSalesOrderLines_v6)
				-- dbo.OrderLines
				-- dbo.LineTypes
				-- dbo.OrderLineProducts
				-- Product.Products
				-- Product.ProductVersions
				-- Product.ProductGroups
				-- dbo.OrderStyleVersions
				-- Product.Catalogs 
				-- Product.CatalogVersions
				-- dbo.OrderAddresses
			    -- dbo.AddressType
			    -- Product.ProductVersionDescriptionTranslations
				-- Product.StyleVersionDescriptionTranslations
				-- Product.CatalogVersionDescriptionTranslations
			    dbo.[Address]
					-- dbo.OrganizationAddresses
					-- dbo.Addresses
					-- dbo.Countries
					-- dbo.OrganizationShipAddresses
					-- dbo.FreightTerms
					-- dbo.ShippingZones

	
		DCC.dbo.vGetShipLoadDateByOlnID
			-- inSight.dbo.OrderLines
			
			inSight.dbo.vwShipments
				-- dbo.Shipments
				-- dbo.Organizations
				-- dbo.ShipmentStatuses
				-- dbo.ShipmentModes
				-- dbo.ShipmentTypes
				-- dbo.Plant
				-- dbo.Trucks 
				-- dbo.UnitsOfMeasure
				-- dbo.ShipmentAttributeValues
				-- dbo.AttributeList  
		
	
	[DCC].[dbo].[vDCC_FQAd_byProdDate]
		dbo.vDCC_ScanPoint_Log
			-- dbo.DCC_ScanPoint_Log
			-- dbo.VBS_Depts
			-- dbo.DCCWeb_UserMatrix 
			-- inSight.dbo.OrderItems 
	
	[DCC].[dbo].[vDCC_FQATotalRequired_byProdDate]
		-- same at above
	
	
