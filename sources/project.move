module MyModule::JobReferral {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a referral
    struct Referral has store, key {
        referrer: address,    // Address of the referrer
        referred: address,    // Address of the referred person
        reward_claimed: bool, // Indicates if the reward has been claimed
    }

    /// Function to create a referral
    public fun create_referral(referrer: &signer, referred: address) {
        let referral = Referral {
            referrer: signer::address_of(referrer),
            referred,
            reward_claimed: false,
        };
        move_to(referrer, referral);
    }
}
