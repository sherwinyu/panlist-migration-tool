$(document).ready ->
  if action() == 'migrate'
    setInitVals()
    bindElilistAddress()

setInitVals = ->
  $('input[name="elilist[owners_raw][]"]').attr('checked', true)
  $('select[name="elilist[list_type]"]').val 'Announcement'

bindElilistAddress = ->
  $elilist_list_id = $('input#elilist_list_id')
  $elilist_list_id.on 'keyup', (e)->
    $('label[for="elilist_list_id"]').html "EliList address (#{$elilist_list_id.val()}@elilists.yale.edu)"




