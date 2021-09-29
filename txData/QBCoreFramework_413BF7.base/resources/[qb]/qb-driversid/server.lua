-- @uyuyorum qb-idcard {basic} --

QBCore.Functions.CreateUseableItem("driver_license", function(source,item)
    TriggerClientEvent('qb-driversid:open', source, item)
end)

QBCore.Functions.CreateCallback('qb-driversid:openInformation', function(source, cb, idcard)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local inf = {
        ['name'] = idcard["info"]["lastname"] .. ' ' .. idcard["info"]["firstname"],
        ['gender'] = idcard["info"]["gender"],
        ['dob'] = idcard["info"]["birthdate"],
        ['nationality'] = idcard["info"]["nationality"],
        ['fingerprint'] = idcard["info"]["fingerprint"],
    }
    cb(inf)
end)
