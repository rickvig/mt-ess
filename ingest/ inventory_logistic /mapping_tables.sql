SC.warehouse_log
	vDCC_InvMove_Log
		-- DCC.dbo.DCC_InvMove_Log
		-- DCC.dbo.DCC_InvAdj_Log 		
		-- inSight.dbo.Items
		-- DCC.dbo.DCCWeb_UserMatrix
		-- DCC.dbo.DCC_Inv_Menu_1
	
SC.vDCC_GetDrawerCounts_Detailed_ByProdDate	
	-- inSight.dbo.OrderItems
	-- inSight.dbo.OrderItems
	-- inSight.dbo.Items
	-- inSight.dbo.ItemItemFamilies
	-- inSight.dbo.ItemFamilies
	-- inSight.dbo.ProductionOrders
	-- inSight.dbo.OrderLines
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
			    dbo.[Address]
			    -- dbo.AddressType
			    -- Product.ProductVersionDescriptionTranslations
				-- Product.StyleVersionDescriptionTranslations
				-- Product.CatalogVersionDescriptionTranslations
	
SC.add_2_truck_log
	-- [DCC].[dbo].[DCC_Add2Truck_Log]

inSight.Report.synSalesOrderHeaders
		dbo.vwSalesOrders ord
		-- dbo.Organizations org ON org.venID = ord.venID
		-- dbo.Projects prj ON prj.prjID = ord.prjID
		-- dbo.PaymentTerms pay ON pay.payID = ord.payID
		-- dbo.Currencies cur ON cur.curID = ord.curID
		-- dbo.OrderTypes otp ON otp.otpID = ord.otpID
		-- dbo.TaxCodes tax ON tax.txcID = ord.taxID
		-- dbo.FreightTerms frt ON frt.frtCode = ord.frtCode
		-- dbo.FreightTermDescriptionTranslations frt_trans ON frt_trans.frtID = frt.frtID AND frt_trans.[langID] = @@LANGID
		-- dbo.ShipmentModes
		-- dbo.OrderAddresses

	DCC.dbo.vDCC_SalesOrderPricing_Pivot
		synSalesOrderPricing
			-- Price.PriceRuleValueSetValueConditionCriteriaDetails d
        	-- Price.PriceRuleValueSetValueConditionCriteria 
        	-- dbo.OrderPricing ordp
			-- Price.PriceRules prl ON prl.prlID = ordp.prlID
			-- Price.PriceRuleTypes prlt ON prlt.prltID = prl.prltID
			-- Price.PriceRuleGroups plg ON plg.plgID = prl.plgID
			-- Price.PriceRuleCalculationTypes pct ON pct.pctID = ordp.ordpCalculation
			-- dbo.OrderAddresses oa
		    -- dbo.[Address] addr ON addr.addID = oa.addID
		    -- dbo.AddressType addt ON addt.atcID = addr.atcID
		    -- Price.PriceRuleDescriptionTranslations
	
		DCC.dbo.vDCC_OrderStatusLogPivot 
		-- inSight.dbo.OrderStatusLog
		-- inSight.dbo.OrderStatuses
		
		
		
		
SC.vGetOrderPlantCode
	-- inSight.Sales.OrderLineInstances olni
	-- inSight.dbo.OrderLines


SC.vDocked_Orders
	vGetShipment_Items
		vGetShipment gs WITH (NOLOCK) 
			inSight.dbo.vwShipments
				-- dbo.Shipments shp
				-- dbo.Organizations org ON org.venID = shp.venID
				-- dbo.ShipmentStatuses stt ON stt.sttID = shp.sttID
				-- dbo.ShipmentModes shm ON shm.shmID = shp.shmID
				-- dbo.ShipmentTypes shpt ON shpt.shptID = shp.shptID
				-- dbo.Plant plt ON plt.pltID = shp.pltID
				-- dbo.Trucks trk ON trk.trkID = shp.trkID
				
				dbo.vwShipmentAttributeValues shpav ON shpav.shpIDshpAv = shp.shpID
					-- dbo.ShipmentAttributeValues av
					-- dbo.AttributeList atbl ON atbl.atbID = av.atbID AND atbl.atblCode = av.shpavValue AND atbl.atblActive = 1

				dbo.vwShipmentMeasures shpm ON shpm.shpID = shp.shpID
					vwShipmentOrderItems
						-- dbo.OrderItems ori
						-- dbo.OrderItemShipments shpo 
						-- dbo.Shipments
						-- dbo.OrderLineProductMeasures
						-- dbo.UnitsOfMeasure 
						-- dbo.UOMConversionDefaults
			
		-- inSight.dbo.ShipmentStops ss with (nolock) 
		-- inSight.dbo.vwShipmentOrderItems AS soi WITH (NOLOCK) ON ss.shpID = soi.shpID 
		
		vGetContainerByOriID  
			-- inSight.dbo.OrderItems AS ori with (nolock) LEFT OUTER JOIN
            -- inSight.dbo.ItemContainer
             
		vOrderAddressID
			-- inSight.dbo.OrderAddresse
			inSight.Report.synAddresses
				dbo.[Address] addr
					-- dbo.OrganizationAddresses oadr
					-- dbo.Addresses adr ON adr.adrID = oadr.adrID
					-- dbo.Countries cou ON cou.couID = adr.couID
					-- dbo.OrganizationShipAddresses osadr ON osadr.addID = oadr.addID
					-- dbo.FreightTerms frt ON frt.frtID = osadr.frtID
					-- dbo.ShippingZones 
				-- dbo.AddressType addt ON addt.atcID = addr.atcID
				-- dbo.TaxCodes tax ON tax.txcID = addr.taxID
				-- dbo.Languages lang ON lang.[langID] = addr.[langID]
				-- dbo.ShipmentModes shm ON shm.shmID = addr.shmIDDefault
				-- dbo.Organizations car ON car.venID = addr.venIDCarrier
				-- dbo.FreightTerms frt ON frt.frtCode = addr.frtCode
				-- dbo.FreightTermDescriptionTranslations frt_trans ON frt_trans.frtID = frt.frtID AND frt_trans.[langID] = @@LANGID
				-- dbo.ShippingZones
				
	
	inSight.Report.vDCC_GetLineFeaturesByOlnID_HeaderOnly
		Report.synSalesOrderLines sol with (nolock)
			-- inSight.dbo.OrderLines oln with (nolock) ON oln.olnID = sol.olnID
			-- dbo.Orders AS o with (nolock) ON sol.ordID = o.ordID 
		
		Report.synSalesOrderHeaders soh with (nolock) ON soh.ordID = sol.ordID
			dbo.vwSalesOrders ord
			-- dbo.Organizations org ON org.venID = ord.venID
			-- dbo.Projects prj ON prj.prjID = ord.prjID
			-- dbo.PaymentTerms pay ON pay.payID = ord.payID
			-- dbo.Currencies cur ON cur.curID = ord.curID
			-- dbo.OrderTypes otp ON otp.otpID = ord.otpID
			-- dbo.TaxCodes tax ON tax.txcID = ord.taxID
			-- dbo.FreightTerms frt ON frt.frtCode = ord.frtCode
			-- dbo.FreightTermDescriptionTranslations frt_trans ON frt_trans.frtID = frt.frtID AND frt_trans.[langID] = @@LANGID
			-- dbo.ShipmentModes
			-- dbo.OrderAddresses
		
		inSight.Report.vDCC_GetOrderAttributesByOrdID goa with (nolock) ON goa.ordID = sol.ordID /*added 1-27-21*/
			Report.synSalesOrderHeaders
			Report.synSalesOrderLineOptions
				vwSalesOrderLineOptions_v6
					-- dbo.OrderLineOptions olno
					-- dbo.OrderLines oln ON oln.olnID = olno.olnID
					-- dbo.OrderLineProducts olnp ON olnp.olnID = olno.olnID -- LEFT JOIN - How can I have an option with no product? Bad Data?
					-- Product.ProductVersionFeatures pftr
					-- Product.Features ftr ON ftr.ftrID = olno.ftrID
					-- Product.Options opt ON opt.optID = olno.optID
					-- Product.FeatureOptions fo ON fo.ftrID = ftr.ftrID AND fo.optID = olno.optID
					-- Product.Catalogs cl ON cl.clID = olno.clID
					-- Product.CatalogVersions clv ON clv.clID = olno.clID AND clv.clvVerNo = olno.clvVerNo
					-- dbo.OptionOrigins opto ON opto.optoID = olno.optoID
					-- Product.ProductVersionFeatureDescriptionTranslations pvftrtrans
				    -- Product.FeatureDescriptionTranslations ftrtrans
				    -- Product.FeatureOptionDescriptionTranslations fotrans
				    -- Product.OptionDescriptionTranslations opttrans
				    -- Product.CatalogVersionDescriptionTranslations clvtrans
					
			



