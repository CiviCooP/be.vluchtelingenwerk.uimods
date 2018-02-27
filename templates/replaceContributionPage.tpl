{literal}
  <script type="text/javascript">
    cj('.crm-contribution-thankyou_date').each(function() {
      var campaignElement = this;
      var contributionId = cj(this).parent().attr('id').substr(5,1);
      CRM.api3('Contribution', 'getvalue', {
        "return": "campaign_id",
        "id": contributionId
      }).done(function(contribution) {
        CRM.api3('Campaign', 'getvalue', {
          "return": "title",
          "id": contribution.result
        }).done(function(campaign) {
          campaignElement.innerHTML = campaign.result;
        });
      });
    });
    cj('.crm-product_name').hide();
    cj('.sorting').each(function() {
      if (this.innerHTML === "Bedankje verzonden" || this.innerHTML === "Thank-you Sent" || this.innerHTML === "Remerciement envoyé") {
        this.outerHTML = '<label><strong>Campagne</strong></label>';
      }
      if (this.innerHTML === "Relatiegeschenk" || this.innerHTML === "Premium" || this.innerHTML === "Cadeau") {
        cj(this).hide();
      }
    });
  </script>
{/literal}