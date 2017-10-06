# UICollectionView-Multiple-Sections-and-Headers


Define your UICollectionViewCell which will be your Header view- In my case I have two headers - OfferHeaderCell and APRHeaderCell defined as below:

````
verticalCollectionView.register(UINib(nibName: "OfferHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "OfferHeaderCell")
        verticalCollectionView.register(UINib(nibName: "APRHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "APRHeaderCell")
````        

Go ahead and return a header for each section and then set the size of the section header to have a size of zero in this UICollectionViewDelegate function

````
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section==0) {
            return CGSize.zero
        } else if (section==1) {
            return CGSize(width:collectionView.frame.size.width, height:133)
        } else {
            return CGSize(width:collectionView.frame.size.width, height:100)
        }

    }
````

